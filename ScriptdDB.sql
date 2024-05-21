CREATE DATABASE RockDB
GO
USE RockDB
GO
CREATE TABLE Genre
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE Artist
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE Album
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title NVARCHAR(100) NOT NULL,
	IdArtist INT NOT NULL,

	CONSTRAINT FK_Album_Artist
	FOREIGN KEY (IdArtist) REFERENCES Artist(Id)
)
GO
CREATE TABLE Track
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title NVARCHAR(100) NOT NULL,
	IdAlbum INT NOT NULL,
	IdGenre INT NOT NULL,
	Duration INT NOT NULL,
	Size INT NOT NULL,
	Price DECIMAL NOT NULL,

	CONSTRAINT FK_Track_Album
	FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
	CONSTRAINT FK_Track_Genre
	FOREIGN KEY (IdGenre) REFERENCES Genre(Id),
)

GO

CREATE PROCEDURE AddArtist (@Title NVARCHAR(100))
AS
BEGIN
INSERT INTO Artist VALUES
(@Title)
END;

GO

CREATE PROCEDURE AddGenre (@Title NVARCHAR(100))
AS
BEGIN
INSERT INTO Genre VALUES
(@Title)
END;

GO

CREATE PROCEDURE AddAlbum (@Title NVARCHAR(100), @IdArtist INT)
AS
BEGIN
INSERT INTO Album VALUES
(@Title, @IdArtist)
END;

GO

CREATE PROCEDURE AddTrack (@Title NVARCHAR(100), @IdAlbum INT, @IdGenre INT, 
@Duration INT, @Size INT, @Price DECIMAL)
AS
BEGIN
INSERT INTO Track VALUES
(@Title , @IdAlbum , @IdGenre , 
@Duration , @Size , @Price )
END;

GO

CREATE PROCEDURE DeleteGenre (@Id INT)
AS
BEGIN
DELETE Track WHERE IdGenre = @Id
DELETE Genre WHERE Id = @Id
END;

GO

CREATE PROCEDURE DeleteArtist (@Id INT)
AS	
BEGIN
DELETE Track WHERE IdAlbum = (SELECT Id FROM Album WHERE IdArtist = @Id)
DELETE Album WHERE IdArtist = @Id
DELETE Artist WHERE Id = @Id
END;

GO

CREATE PROCEDURE DeleteAlbum (@Id INT)
AS
BEGIN
DELETE Track WHERE IdAlbum = @Id
DELETE Album WHERE Id = @Id
END;

GO

CREATE PROCEDURE DeleteTrack(@Id INT)
AS
BEGIN
DELETE Track WHERE Id = @Id
END;

GO

INSERT INTO Genre VALUES
('Rock'),
('Jazz'),
('Metal'),
('Alternative & Punk'),
('Rock And Roll'),
('Blues'),
('Latin'),
('Reggae'),
('Pop'),
('Soundtrack'),
('Bossa Nova'),
('Easy Listening'),
('Heavy Metal'),
('R&B/Soul'),
('Electronica/Dance'),
('World'),
('Hip Hop/Rap'),
('Science Fiction'),
('TV Shows'),
('Sci Fi & Fantasy'),
('Drama'),
('Comedy'),
('Alternative'),
('Classical'),
('Opera');

GO

INSERT INTO Artist VALUES
('AC/DC'),
('Accept'),
('Aerosmith'),
('Alanis Morissette'),
('Alice In Chains'),
('Antônio Carlos Jobim'),
('Apocalyptica'),
('Audioslave'),
('BackBeat'),
('Billy Cobham'),
('Black Label Society'),
('Black Sabbath'),
('Body Count'),
('Bruce Dickinson'),
('Buddy Guy'),
('Caetano Veloso'),
('Chico Buarque'),
('Chico Science & Nação Zumbi'),
('Cidade Negra'),
('Claudio Zoli'),
('Various Artists'),
('Led Zeppelin'),
('Frank Zappa & Captain Beefheart'),
('Marcos Valle'),
('Milton Nascimento & Bebeto'),
('Azymuth'),
('Gilberto Gil'),
('João Gilberto'),
('Bebel Gilberto'),
('Jorge Vercilo'),
('Baby Consuelo'),
('Ney Matogrosso'),
('Luiz Melodia'),
('Nando Reis'),
('Pedro Luís & A Parede'),
('O Rappa'),
('Ed Motta'),
('Banda Black Rio'),
('Fernanda Porto'),
('Os Cariocas'),
('Elis Regina'),
('Milton Nascimento'),
('A Cor Do Som'),
('Kid Abelha'),
('Sandra De So'),
('Jorge Ben'),
('Hermeto Pascoal'),
('Barão Vermelho'),
('Edson, DJ Marky & DJ Patife Featuring Fernanda Porto'),
('Metallica'),
('Queen'),
('Kiss'),
('Spyro Gyra'),
('Green Day'),
('David Coverdale'),
('Gonzaguinha'),
('Os Mutantes'),
('Deep Purple'),
('Santana'),
('Santana Feat. Dave Matthews'),
('Santana Feat. Everlast'),
('Santana Feat. Rob Thomas'),
('Santana Feat. Lauryn Hill & Cee-Lo'),
('Santana Feat. The Project G&B'),
('Santana Feat. Mano'),
('Santana Feat. Eagle-Eye Cherry'),
('Santana Feat. Eric Clapton'),
('Miles Davis'),
('Gene Krupa'),
('Toquinho & Vinicius'),
('Vinocius De Moraes & Baden Powell'),
('Vinicius De Moraes'),
('Vinicius E Qurteto Em Cy'),
('Vinicius E Odette Lara'),
('Vinicius, Toquinho & Quarteto Em Cy'),
('Creedence Clearwater Revival'),
('Cássia Eller'),
('Def Leppard'),
('Dennis Chambers'),
('Djavan'),
('Eric Clapton'),
('Faith No More'),
('Falamansa'),
('Foo Fighters'),
('Frank Sinatra'),
('Funk Como Le Gusta'),
('Godsmack'),
('Guns N  Roses'),
('Incognito'),
('Iron Maiden'),
('James Brown'),
('Jamiroquai'),
('JET'),
('Jimi Hendrix'),
('Joe Satriani'),
('Jota Quest'),
('João Suplicy'),
('Judas Priest'),
('Legião Urbana'),
('Lenny Kravitz'),
('Lulu Santos'),
('Marillion'),
('Marisa Monte'),
('Marvin Gaye'),
('Men At Work'),
('Motorhead'),
('Motorhead & Girlschool'),
('Mônica Marianno'),
('Motley Crüe'),
('Nirvana'),
('O Terço'),
('Olodum'),
('Os Paralamas Do Sucesso'),
('Ozzy Osbourne'),
('Page & Plant'),
('Passengers'),
('Paul D Ianno'),
('Pearl Jam'),
('Peter Tosh'),
('Pink Floyd'),
('Planet Hemp'),
('R.E.M. Feat. Kate Pearson'),
('R.E.M. Feat. KRS-One'),
('R.E.M.'),
('Raimundos'),
('Raul Seixas'),
('Red Hot Chili Peppers'),
('Rush'),
('Simply Red'),
('Skank'),
('Smashing Pumpkins'),
('Soundgarden'),
('Stevie Ray Vaughan & Double Trouble'),
('Stone Temple Pilots'),
('System Of A Down'),
('Terry Bozzio, Tony Levin & Steve Stevens'),
('The Black Crowes'),
('The Clash'),
('The Cult'),
('The Doors'),
('The Police'),
('The Rolling Stones'),
('The Tea Party'),
('The Who'),
('Tim Maia'),
('Titãs'),
('Battlestar Galactica'),
('Heroes'),
('Lost'),
('U2'),
('UB40'),
('Van Halen'),
('Velvet Revolver'),
('Whitesnake'),
('Zeca Pagodinho'),
('The Office'),
('Dread Zeppelin'),
('Battlestar Galactica (Classic)'),
('Aquaman'),
('Christina Aguilera featuring BigElf'),
('Aerosmith & Sierra Leone s Refugee Allstars'),
('Los Lonely Boys'),
('Corinne Bailey Rae'),
('Dhani Harrison & Jakob Dylan'),
('Jackson Browne'),
('Avril Lavigne'),
('Big & Rich'),
('Youssou N Dour'),
('Black Eyed Peas'),
('Jack Johnson'),
('Ben Harper'),
('Snow Patrol'),
('Matisyahu'),
('The Postal Service'),
('Jaguares'),
('The Flaming Lips'),
('Jack s Mannequin & Mick Fleetwood'),
('Regina Spektor'),
('Scorpions'),
('House Of Pain'),
('Xis'),
('Nega Gizza'),
('Gustavo & Andres Veiga & Salazar'),
('Rodox'),
('Charlie Brown Jr.'),
('Pedro Luís E A Parede'),
('Los Hermanos'),
('Mundo Livre S/A'),
('Otto'),
('Instituto'),
('Nação Zumbi'),
('DJ Dolores & Orchestra Santa Massa'),
('Seu Jorge'),
('Sabotage E Instituto'),
('Stereo Maracana'),
('Cake'),
('Aisha Duo'),
('Habib Koité and Bamada'),
('Karsh Kale'),
('The Posies'),
('Luciana Souza/Romero Lubambo'),
('Aaron Goldberg'),
('Nicolaus Esterhazy Sinfonia'),
('Temple of the Dog'),
('Chris Cornell'),
('Alberto Turco & Nova Schola Gregoriana'),
('Richard Marlow & The Choir of Trinity College, Cambridge'),
('English Concert & Trevor Pinnock'),
('Anne-Sophie Mutter, Herbert Von Karajan & Wiener Philharmoniker'),
('Hilary Hahn, Jeffrey Kahane, Los Angeles Chamber Orchestra & Margaret Batjer'),
('Wilhelm Kempff'),
('Yo-Yo Ma'),
('Scholars Baroque Ensemble'),
('Academy of St. Martin in the Fields & Sir Neville Marriner'),
('Academy of St. Martin in the Fields Chamber Ensemble & Sir Neville Marriner'),
('Berliner Philharmoniker, Claudio Abbado & Sabine Meyer'),
('Royal Philharmonic Orchestra & Sir Thomas Beecham'),
('Orchestre Révolutionnaire et Romantique & John Eliot Gardiner'),
('Britten Sinfonia, Ivor Bolton & Lesley Garrett'),
('Chicago Symphony Chorus, Chicago Symphony Orchestra & Sir Georg Solti'),
('Sir Georg Solti & Wiener Philharmoniker'),
('Academy of St. Martin in the Fields, John Birch, Sir Neville Marriner & Sylvia McNair'),
('London Symphony Orchestra & Sir Charles Mackerras'),
('Barry Wordsworth & BBC Concert Orchestra'),
('Herbert Von Karajan, Mirella Freni & Wiener Philharmoniker'),
('Eugene Ormandy'),
('Luciano Pavarotti'),
('Leonard Bernstein & New York Philharmonic'),
('Boston Symphony Orchestra & Seiji Ozawa'),
('Aaron Copland & London Symphony Orchestra'),
('Ton Koopman'),
('Sergei Prokofiev & Yuri Temirkanov'),
('Chicago Symphony Orchestra & Fritz Reiner'),
('Orchestra of The Age of Enlightenment'),
('Emanuel Ax, Eugene Ormandy & Philadelphia Orchestra'),
('James Levine'),
('Berliner Philharmoniker & Hans Rosbaud'),
('Maurizio Pollini'),
('Academy of St. Martin in the Fields, Sir Neville Marriner & William Bennett'),
('Gustav Mahler'),
('Felix Schmidt, London Symphony Orchestra & Rafael Frühbeck de Burgos'),
('Edo de Waart & San Francisco Symphony'),
('Antal Doráti & London Symphony Orchestra'),
('Choir Of Westminster Abbey & Simon Preston'),
('Michael Tilson Thomas & San Francisco Symphony'),
('Chor der Wiener Staatsoper, Herbert Von Karajan & Wiener Philharmoniker'),
('The King s Singers'),
('Berliner Philharmoniker & Herbert Von Karajan'),
('Sir Georg Solti, Sumi Jo & Wiener Philharmoniker'),
('Christopher O Riley'),
('Fretwork'),
('Amy Winehouse'),
('Calexico'),
('Otto Klemperer & Philharmonia Orchestra'),
('Yehudi Menuhin'),
('Philharmonia Orchestra & Sir Neville Marriner'),
('Academy of St. Martin in the Fields, Sir Neville Marriner & Thurston Dart'),
('Les Arts Florissants & William Christie'),
('The 12 Cellists of The Berlin Philharmonic'),
('Adrian Leaper & Doreen de Feis'),
('Roger Norrington, London Classical Players'),
('Charles Dutoit & L Orchestre Symphonique de Montréal'),
('Equale Brass Ensemble, John Eliot Gardiner & Munich Monteverdi Orchestra and Choir'),
('Kent Nagano and Orchestre de l Opéra de Lyon'),
('Julian Bream'),
('Martin Roscoe'),
('Goteborgs Symfoniker & Neeme Järvi'),
('Itzhak Perlman'),
('Michele Campanella'),
('Gerald Moore'),
('Mela Tenenbaum, Pro Musica Prague & Richard Kapp'),
('Emerson String Quartet'),
('C. Monteverdi, Nigel Rogers - Chiaroscuro; London Baroque; London Cornett & Sackbu'),
('Nash Ensemble'),
('Philip Glass Ensemble');
GO
INSERT INTO Album VALUES
('For Those About To Rock We Salute You',1),
('Balls to the Wall',2),
('Restless and Wild',2),
('Let There Be Rock',1),
('Big Ones',3),
('Jagged Little Pill',4),
('Facelift',5),
('Warner 25 Anos',6),
('Plays Metallica By Four Cellos',7),
('Audioslave',8),
('Out Of Exile',8),
('BackBeat Soundtrack',9),
('The Best Of Billy Cobham',10),
('Alcohol Fueled Brewtality Live! [Disc 1]',11),
('Alcohol Fueled Brewtality Live! [Disc 2]',11),
('Black Sabbath',12),
('Black Sabbath Vol. 4 (Remaster)',12),
('Body Count',13),
('Chemical Wedding',14),
('The Best Of Buddy Guy - The Millenium Collection',15),
('Prenda Minha',16),
('Sozinho Remix Ao Vivo',16),
('Minha Historia',17),
('Afrociberdelia',18),
('Da Lama Ao Caos',18),
('Acústico MTV [Live]',19),
('Cidade Negra - Hits',19),
('Na Pista',20),
('Axé Bahia 2001',21),
('BBC Sessions [Disc 1] [Live]',22),
('Bongo Fury',23),
('Carnaval 2001',21),
('Chill: Brazil (Disc 1)',24),
('Chill: Brazil (Disc 2)',6),
('Garage Inc. (Disc 1)',50),
('Greatest Hits II',51),
('Greatest Kiss',52),
('Heart of the Night',53),
('International Superhits',54),
('Into The Light',55),
('Meus Momentos',56),
('Minha História',57),
('MK III The Final Concerts [Disc 1]',58),
('Physical Graffiti [Disc 1]',22),
('Sambas De Enredo 2001',21),
('Supernatural',59),
('The Best of Ed Motta',37),
('The Essential Miles Davis [Disc 1]',68),
('The Essential Miles Davis [Disc 2]',68),
('The Final Concerts (Disc 2)',58),
('Up An  Atom',69),
('Vinícius De Moraes - Sem Limite',70),
('Vozes do MPB',21),
('Chronicle, Vol. 1',76),
('Chronicle, Vol. 2',76),
('Cássia Eller - Coleção Sem Limite [Disc 2]',77),
('Cássia Eller - Sem Limite [Disc 1]',77),
('Come Taste The Band',58),
('Deep Purple In Rock',58),
('Fireball',58),
('Knocking at Your Back Door: The Best Of Deep Purple in the 80 s',58),
('Machine Head',58),
('Purpendicular',58),
('Slaves And Masters',58),
('Stormbringer',58),
('The Battle Rages On',58),
('Vault: Def Leppard s Greatest Hits',78),
('Outbreak',79),
('Djavan Ao Vivo - Vol. 02',80),
('Djavan Ao Vivo - Vol. 1',80),
('Elis Regina-Minha História',41),
('The Cream Of Clapton',81),
('Unplugged',81),
('Album Of The Year',82),
('Angel Dust',82),
('King For A Day Fool For A Lifetime',82),
('The Real Thing',82),
('Deixa Entrar',83),
('In Your Honor [Disc 1]',84),
('In Your Honor [Disc 2]',84),
('One By One',84),
('The Colour And The Shape',84),
('My Way: The Best Of Frank Sinatra [Disc 1]',85),
('Roda De Funk',86),
('As Canções de Eu Tu Eles',27),
('Quanta Gente Veio Ver (Live)',27),
('Quanta Gente Veio ver--Bônus De Carnaval',27),
('Faceless',87),
('American Idiot',54),
('Appetite for Destruction',88),
('Use Your Illusion I',88),
('Use Your Illusion II',88),
('Blue Moods',89),
('A Matter of Life and Death',90),
('A Real Dead One',90),
('A Real Live One',90),
('Brave New World',90),
('Dance Of Death',90),
('Fear Of The Dark',90),
('Iron Maiden',90),
('Killers',90),
('Live After Death',90),
('Live At Donington 1992 (Disc 1)',90),
('Live At Donington 1992 (Disc 2)',90),
('No Prayer For The Dying',90),
('Piece Of Mind',90),
('Powerslave',90),
('Rock In Rio [CD1]',90),
('Rock In Rio [CD2]',90),
('Seventh Son of a Seventh Son',90),
('Somewhere in Time',90),
('The Number of The Beast',90),
('The X Factor',90),
('Virtual XI',90),
('Sex Machine',91),
('Emergency On Planet Earth',92),
('Synkronized',92),
('The Return Of The Space Cowboy',92),
('Get Born',93),
('Are You Experienced?',94),
('Surfing with the Alien (Remastered)',95),
('Jorge Ben Jor 25 Anos',46),
('Jota Quest-1995',96),
('Cafezinho',97),
('Living After Midnight',98),
('Unplugged [Live]',52),
('BBC Sessions [Disc 2] [Live]',22),
('Coda',22),
('Houses Of The Holy',22),
('In Through The Out Door',22),
('IV',22),
('Led Zeppelin I',22),
('Led Zeppelin II',22),
('Led Zeppelin III',22),
('Physical Graffiti [Disc 2]',22),
('Presence',22),
('The Song Remains The Same (Disc 1)',22),
('The Song Remains The Same (Disc 2)',22),
('A TempestadeTempestade Ou O Livro Dos Dias',99),
('Mais Do Mesmo',99),
('Greatest Hits',100),
('Lulu Santos - RCA 100 Anos De Música - Álbum 01',101),
('Lulu Santos - RCA 100 Anos De Música - Álbum 02',101),
('Misplaced Childhood',102),
('Barulhinho Bom',103),
('Seek And Shall Find: More Of The Best (1963-1981)',104),
('The Best Of Men At Work',105),
('Black Album',50),
('Garage Inc. (Disc 2)',50),
('Kill  Em All',50),
('Load',50),
('Master Of Puppets',50),
('ReLoad',50),
('Ride The Lightning',50),
('St. Anger',50),
('...And Justice For All',50),
('Miles Ahead',68),
('Milton Nascimento Ao Vivo',42),
('Minas',42),
('Ace Of Spades',106),
('Demorou...',108),
('Motley Crue Greatest Hits',109),
('From The Muddy Banks Of The Wishkah [Live]',110),
('Nevermind',110),
('Compositores',111),
('Olodum',112),
('Acústico MTV',113),
('Arquivo II',113),
('Arquivo Os Paralamas Do Sucesso',113),
('Bark at the Moon (Remastered)',114),
('Blizzard of Ozz',114),
('Diary of a Madman (Remastered)',114),
('No More Tears (Remastered)',114),
('Tribute',114),
('Walking Into Clarksdale',115),
('Original Soundtracks 1',116),
('The Beast Live',117),
('Live On Two Legs [Live]',118),
('Pearl Jam',118),
('Riot Act',118),
('Ten',118),
('Vs.',118),
('Dark Side Of The Moon',120),
('Os Cães Ladram Mas A Caravana Não Pára',121),
('Greatest Hits I',51),
('News Of The World',51),
('Out Of Time',122),
('Green',124),
('New Adventures In Hi-Fi',124),
('The Best Of R.E.M.: The IRS Years',124),
('Cesta Básica',125),
('Raul Seixas',126),
('Blood Sugar Sex Magik',127),
('By The Way',127),
('Californication',127),
('Retrospective I (1974-1980)',128),
('Santana - As Years Go By',59),
('Santana Live',59),
('Maquinarama',130),
('O Samba Poconé',130),
('Judas 0: B-Sides and Rarities',131),
('Rotten Apples: Greatest Hits',131),
('A-Sides',132),
('Morning Dance',53),
('In Step',133),
('Core',134),
('Mezmerize',135),
('[1997] Black Light Syndrome',136),
('Live [Disc 1]',137),
('Live [Disc 2]',137),
('The Singles',138),
('Beyond Good And Evil',139),
('Pure Cult: The Best Of The Cult (For Rockers, Ravers, Lovers & Sinners) [UK]',139),
('The Doors',140),
('The Police Greatest Hits',141),
('Hot Rocks, 1964-1971 (Disc 1)',142),
('No Security',142),
('Voodoo Lounge',142),
('Tangents',143),
('Transmission',143),
('My Generation - The Very Best Of The Who',144),
('Serie Sem Limite (Disc 1)',145),
('Serie Sem Limite (Disc 2)',145),
('Acústico',146),
('Volume Dois',146),
('Battlestar Galactica: The Story So Far',147),
('Battlestar Galactica, Season 3',147),
('Heroes, Season 1',148),
('Lost, Season 3',149),
('Lost, Season 1',149),
('Lost, Season 2',149),
('Achtung Baby',150),
('All That You Can t Leave Behind',150),
('B-Sides 1980-1990',150),
('How To Dismantle An Atomic Bomb',150),
('Pop',150),
('Rattle And Hum',150),
('The Best Of 1980-1990',150),
('War',150),
('Zooropa',150),
('UB40 The Best Of - Volume Two [UK]',151),
('Diver Down',152),
('The Best Of Van Halen, Vol. I',152),
('Van Halen',152),
('Van Halen III',152),
('Contraband',153),
('Vinicius De Moraes',72),
('Ao Vivo [IMPORT]',155),
('The Office, Season 1',156),
('The Office, Season 2',156),
('The Office, Season 3',156),
('Un-Led-Ed',157),
('Battlestar Galactica (Classic), Season 1',158),
('Aquaman',159),
('Instant Karma: The Amnesty International Campaign to Save Darfur',150),
('Speak of the Devil',114),
('20th Century Masters - The Millennium Collection: The Best of Scorpions',179),
('House of Pain',180),
('Radio Brasil (O Som da Jovem Vanguarda) - Seleccao de Henrique Amaro',36),
('Cake: B-Sides and Rarities',196),
('LOST, Season 4',149),
('Quiet Songs',197),
('Muso Ko',198),
('Realize',199),
('Every Kind of Light',200),
('Duos II',201),
('Worlds',202),
('The Best of Beethoven',203),
('Temple of the Dog',204),
('Carry On',205),
('Revelations',8),
('Adorate Deum: Gregorian Chant from the Proper of the Mass',206),
('Allegri: Miserere',207),
('Pachelbel: Canon & Gigue',208),
('Vivaldi: The Four Seasons',209),
('Bach: Violin Concertos',210),
('Bach: Goldberg Variations',211),
('Bach: The Cello Suites',212),
('Handel: The Messiah (Highlights)',213),
('The World of Classical Favourites',214),
('Sir Neville Marriner: A Celebration',215),
('Mozart: Wind Concertos',216),
('Haydn: Symphonies 99 - 104',217),
('Beethoven: Symhonies Nos. 5 & 6',218),
('A Soprano Inspired',219),
('Great Opera Choruses',220),
('Wagner: Favourite Overtures',221),
('Fauré: Requiem, Ravel: Pavane & Others',222),
('Tchaikovsky: The Nutcracker',223),
('The Last Night of the Proms',224),
('Puccini: Madama Butterfly - Highlights',225),
('Holst: The Planets, Op. 32 & Vaughan Williams: Fantasies',226),
('Pavarotti s Opera Made Easy',227),
('Great Performances - Barber s Adagio and Other Romantic Favorites for Strings',228),
('Carmina Burana',229),
('A Copland Celebration, Vol. I',230),
('Bach: Toccata & Fugue in D Minor',231),
('Prokofiev: Symphony No.1',232),
('Scheherazade',233),
('Bach: The Brandenburg Concertos',234),
('Chopin: Piano Concertos Nos. 1 & 2',235),
('Mascagni: Cavalleria Rusticana',236),
('Sibelius: Finlandia',237),
('Beethoven Piano Sonatas: Moonlight & Pastorale',238),
('Great Recordings of the Century - Mahler: Das Lied von der Erde',240),
('Elgar: Cello Concerto & Vaughan Williams: Fantasias',241),
('Adams, John: The Chairman Dances',242),
('Tchaikovsky: 1812 Festival Overture, Op.49, Capriccio Italien & Beethoven: Wellington s Victory',243),
('Palestrina: Missa Papae Marcelli & Allegri: Miserere',244),
('Prokofiev: Romeo & Juliet',245),
('Strauss: Waltzes',226),
('Berlioz: Symphonie Fantastique',245),
('Bizet: Carmen Highlights',246),
('English Renaissance',247),
('Handel: Music for the Royal Fireworks (Original Version 1749)',208),
('Grieg: Peer Gynt Suites & Sibelius: Pelléas et Mélisande',248),
('Mozart Gala: Famous Arias',249),
('SCRIABIN: Vers la flamme',250),
('Armada: Music from the Courts of England and Spain',251),
('Mozart: Symphonies Nos. 40 & 41',248),
('Back to Black',252),
('Frank',252),
('Carried to Dust (Bonus Track Version)',253),
('Beethoven: Symphony No. 6  Pastoral  Etc.',254),
('Bartok: Violin & Viola Concertos',255),
('Mendelssohn: A Midsummer Night s Dream',256),
('Bach: Orchestral Suites Nos. 1 - 4',257),
('Charpentier: Divertissements, Airs & Concerts',258),
('South American Getaway',259),
('Górecki: Symphony No. 3',260),
('Purcell: The Fairy Queen',261),
('The Ultimate Relexation Album',262),
('Purcell: Music for the Queen Mary',263),
('Weill: The Seven Deadly Sins',264),
('J.S. Bach: Chaconne, Suite in E Minor, Partita in E Major & Prelude, Fugue and Allegro',265),
('Prokofiev: Symphony No.5 & Stravinksy: Le Sacre Du Printemps',248),
('Szymanowski: Piano Works, Vol. 1',266),
('Nielsen: The Six Symphonies',267),
('Great Recordings of the Century: Paganini s 24 Caprices',268),
('Liszt - 12 Études D Execution Transcendante',269),
('Great Recordings of the Century - Shubert: Schwanengesang, 4 Lieder',270),
('Locatelli: Concertos for Violin, Strings and Continuo, Vol. 3',271),
('Respighi:Pines of Rome',226),
('Schubert: The Late String Quartets & String Quintet (3 CD s)',272),
('Monteverdi: L Orfeo',273),
('Mozart: Chamber Music',274),
('Koyaanisqatsi (Soundtrack from the Motion Picture)',275);

GO


INSERT INTO Track VALUES 
('For Those About To Rock (We Salute You)',1,1,343719,11170334,101),
('Balls to the Wall',2,1,342562,5510424,161),
('Fast As a Shark',3,1,230619,3990994,96),
('Restless and Wild',3,1,252051,4331779,133),
('Princess of the Dawn',3,1,375418,6290521,172),
('Put The Finger On You',1,1,205662,6713451,136),
('Let s Get It Up',1,1,233926,7636561,58),
('Inject The Venom',1,1,210834,6852860,169),
('Snowballed',1,1,203102,6599424,89),
('Evil Walks',1,1,263497,8611245,122),
('C.O.D.',1,1,199836,6566314,160),
('Breaking The Rules',1,1,263288,8596840,161),
('Night Of The Long Knives',1,1,205688,6706347,76),
('Spellbound',1,1,270863,8817038,83),
('Go Down',4,1,331180,10847611,184),
('Dog Eat Dog',4,1,215196,7032162,88),
('Let There Be Rock',4,1,366654,12021261,61),
('Bad Boy Boogie',4,1,267728,8776140,139),
('Problem Child',4,1,325041,10617116,100),
('Overdose',4,1,369319,12066294,50),
('Hell Ain t A Bad Place To Be',4,1,254380,8331286,141),
('Whole Lotta Rosie',4,1,323761,10547154,186),
('Walk On Water',5,1,295680,9719579,160),
('Love In An Elevator',5,1,321828,10552051,200),
('Rag Doll',5,1,264698,8675345,123),
('What It Takes',5,1,310622,10144730,65),
('Dude (Looks Like A Lady)',5,1,264855,8679940,176),
('Janie s Got A Gun',5,1,330736,10869391,136),
('Cryin ',5,1,309263,10056995,128),
('Amazing',5,1,356519,11616195,69),
('Blind Man',5,1,240718,7877453,148),
('Deuces Are Wild',5,1,215875,7074167,104),
('The Other Side',5,1,244375,7983270,148),
('Crazy',5,1,316656,10402398,64),
('Eat The Rich',5,1,251036,8262039,166),
('Angel',5,1,307617,9989331,194),
('Livin  On The Edge',5,1,381231,12374569,98),
('All I Really Want',6,1,284891,9375567,164),
('You Oughta Know',6,1,249234,8196916,129),
('Perfect',6,1,188133,6145404,74),
('Hand In My Pocket',6,1,221570,7224246,148),
('Right Through You',6,1,176117,5793082,182),
('Forgiven',6,1,300355,9753256,179),
('You Learn',6,1,239699,7824837,195),
('Head Over Feet',6,1,267493,8758008,175),
('Mary Jane',6,1,280607,9163588,83),
('Ironic',6,1,229825,7598866,96),
('Not The Doctor',6,1,227631,7604601,178),
('Wake Up',6,1,293485,9703359,125),
('You Oughta Know (Alternate)',6,1,491885,16008629,197),
('We Die Young',7,1,152084,4925362,153),
('Man In The Box',7,1,286641,9310272,170),
('Sea Of Sorrow',7,1,349831,11316328,73),
('Bleed The Freak',7,1,241946,7847716,116),
('I Can t Remember',7,1,222955,7302550,158),
('Love, Hate, Love',7,1,387134,12575396,160),
('It Ain t Like That',7,1,277577,8993793,95),
('Sunshine',7,1,284969,9216057,150),
('Put You Down',7,1,196231,6420530,169),
('Confusion',7,1,344163,11183647,116),
('I Know Somethin (Bout You)',7,1,261955,8497788,183),
('Real Thing',7,1,243879,7937731,144),
('Desafinado',8,2,185338,5990473,124),
('Garota De Ipanema',8,2,285048,9348428,74),
('Samba De Uma Nota Só (One Note Samba)',8,2,137273,4535401,149),
('Por Causa De Você',8,2,169900,5536496,195),
('Ligia',8,2,251977,8226934,75),
('Fotografia',8,2,129227,4198774,180),
('Dindi (Dindi)',8,2,253178,8149148,157),
('Se Todos Fossem Iguais A Você (Instrumental)',8,2,134948,4393377,80),
('Falando De Amor',8,2,219663,7121735,110),
('Angela',8,2,169508,5574957,119),
('Corcovado (Quiet Nights Of Quiet Stars)',8,2,205662,6687994,165),
('Outra Vez',8,2,126511,4110053,75),
('O Boto (Bôto)',8,2,366837,12089673,74),
('Canta, Canta Mais',8,2,271856,8719426,108),
('Enter Sandman',9,3,221701,7286305,192),
('Master Of Puppets',9,3,436453,14375310,163),
('Harvester Of Sorrow',9,3,374543,12372536,142),
('The Unforgiven',9,3,322925,10422447,94),
('Sad But True',9,3,288208,9405526,142),
('Creeping Death',9,3,308035,10110980,56),
('Wherever I May Roam',9,3,369345,12033110,188),
('Welcome Home (Sanitarium)',9,3,350197,11406431,186),
('Cochise',10,1,222380,5339931,102),
('Show Me How to Live',10,1,277890,6672176,163),
('Gasoline',10,1,279457,6709793,107),
('What You Are',10,1,249391,5988186,188),
('Like a Stone',10,1,294034,7059624,144),
('Set It Off',10,1,263262,6321091,198),
('Shadow on the Sun',10,1,343457,8245793,124),
('I am the Highway',10,1,334942,8041411,112),
('Exploder',10,1,206053,4948095,178),
('Hypnotize',10,1,206628,4961887,152),
('Bring em Back Alive',10,1,329534,7911634,88),
('Light My Way',10,1,303595,7289084,127),
('Getaway Car',10,1,299598,7193162,186),
('The Last Remaining Light',10,1,317492,7622615,79),
('Your Time Has Come',11,4,255529,8273592,50),
('Out Of Exile',11,4,291291,9506571,141),
('Be Yourself',11,4,279484,9106160,54),
('Doesn t Remind Me',11,4,255869,8357387,178),
('Drown Me Slowly',11,4,233691,7609178,98),
('Heaven s Dead',11,4,276688,9006158,129),
('The Worm',11,4,237714,7710800,167),
('Man Or Animal',11,4,233195,7542942,79),
('Yesterday To Tomorrow',11,4,273763,8944205,56),
('Dandelion',11,4,278125,9003592,52),
('#1 Zero',11,4,299102,9731988,64),
('The Curse',11,4,309786,10029406,74),
('Money',12,5,147591,2365897,95),
('Long Tall Sally',12,5,106396,1707084,61),
('Bad Boy',12,5,116088,1862126,75),
('Twist And Shout',12,5,161123,2582553,94),
('Please Mr. Postman',12,5,137639,2206986,136),
('C Mon Everybody',12,5,140199,2247846,73),
('Rock  N  Roll Music',12,5,141923,2276788,157),
('Slow Down',12,5,163265,2616981,102),
('Roadrunner',12,5,143595,2301989,80),
('Carol',12,5,143830,2306019,90),
('Good Golly Miss Molly',12,5,106266,1704918,150),
('20 Flight Rock',12,5,107807,1299960,117),
('Quadrant',13,2,261851,8538199,108),
('Snoopy s search-Red baron',13,2,456071,15075616,113),
('Spanish moss-"A sound portrait"-Spanish moss',13,2,248084,8217867,184),
('Moon germs',13,2,294060,9714812,117),
('Stratus',13,2,582086,19115680,123),
('The pleasant pheasant',13,2,318066,10630578,115),
('Solo-Panhandler',13,2,246151,8230661,64),
('Do what cha wanna',13,2,274155,9018565,163),
('Intro/ Low Down',14,3,323683,10642901,156),
('13 Years Of Grief',14,3,246987,8137421,66),
('Stronger Than Death',14,3,300747,9869647,126),
('All For You',14,3,235833,7726948,117),
('Super Terrorizer',14,3,319373,10513905,70),
('Phoney Smile Fake Hellos',14,3,273606,9011701,64),
('Lost My Better Half',14,3,284081,9355309,137),
('Bored To Tears',14,3,247327,8130090,51),
('A.N.D.R.O.T.A.Z.',14,3,266266,8574746,190),
('Born To Booze',14,3,282122,9257358,166),
('World Of Trouble',14,3,359157,11820932,114),
('No More Tears',14,3,555075,18041629,88),
('The Begining... At Last',14,3,365662,11965109,125),
('Heart Of Gold',15,3,194873,6417460,111),
('Snowblind',15,3,420022,13842549,127),
('Like A Bird',15,3,276532,9115657,181),
('Blood In The Wall',15,3,284368,9359475,171),
('The Beginning...At Last',15,3,271960,8975814,163),
('Black Sabbath',16,3,382066,12440200,125),
('The Wizard',16,3,264829,8646737,123),
('Behind The Wall Of Sleep',16,3,217573,7169049,122),
('N.I.B.',16,3,368770,12029390,183),
('Evil Woman',16,3,204930,6655170,154),
('Sleeping Village',16,3,644571,21128525,54),
('Warning',16,3,212062,6893363,103),
('Wheels Of Confusion / The Straightener',17,3,494524,16065830,51),
('Tomorrow s Dream',17,3,192496,6252071,135),
('Changes',17,3,286275,9175517,129),
('FX',17,3,103157,3331776,85),
('Supernaut',17,3,285779,9245971,164),
('Snowblind',17,3,331676,10813386,169),
('Cornucopia',17,3,234814,7653880,96),
('Laguna Sunrise',17,3,173087,5671374,133),
('St. Vitus Dance',17,3,149655,4884969,78),
('Under The Sun/Every Day Comes and Goes',17,3,350458,11360486,137),
('Smoked Pork',18,4,47333,1549074,121),
('Body Count s In The House',18,4,204251,6715413,112),
('Now Sports',18,4,4884,161266,95),
('Body Count',18,4,317936,10489139,111),
('A Statistic',18,4,6373,211997,118),
('Bowels Of The Devil',18,4,223216,7324125,95),
('The Real Problem',18,4,11650,387360,128),
('KKK Bitch',18,4,173008,5709631,98),
('D Note',18,4,95738,3067064,123),
('Voodoo',18,4,300721,9875962,145),
('The Winner Loses',18,4,392254,12843821,176),
('There Goes The Neighborhood',18,4,350171,11443471,155),
('Oprah',18,4,6635,224313,194),
('Evil Dick',18,4,239020,7828873,178),
('Body Count Anthem',18,4,166426,5463690,110),
('Momma s Gotta Die Tonight',18,4,371539,12122946,197),
('Freedom Of Speech',18,4,281234,9337917,54),
('King In Crimson',19,3,283167,9218499,133),
('Chemical Wedding',19,3,246177,8022764,87),
('The Tower',19,3,285257,9435693,51),
('Killing Floor',19,3,269557,8854240,185),
('Book Of Thel',19,3,494393,16034404,124),
('Gates Of Urizen',19,3,265351,8627004,69),
('Jerusalem',19,3,402390,13194463,153),
('Trupets Of Jericho',19,3,359131,11820908,118),
('Machine Men',19,3,341655,11138147,64),
('The Alchemist',19,3,509413,16545657,96),
('Realword',19,3,237531,7802095,79),
('First Time I Met The Blues',20,6,140434,4604995,77),
('Let Me Love You Baby',20,6,175386,5716994,81),
('Stone Crazy',20,6,433397,14184984,100),
('Pretty Baby',20,6,237662,7848282,65),
('When My Left Eye Jumps',20,6,235311,7685363,100),
('Leave My Girl Alone',20,6,204721,6859518,147),
('She Suits Me To A Tee',20,6,136803,4456321,148),
('Keep It To Myself (Aka Keep It To Yourself)',20,6,166060,5487056,151),
('My Time After Awhile',20,6,182491,6022698,86),
('Too Many Ways (Alternate)',20,6,135053,4459946,139),
('Talkin   Bout Women Obviously',20,6,589531,19161377,95),
('Jorge Da Capadócia',21,7,177397,5842196,172),
('Prenda Minha',21,7,99369,3225364,109),
('Meditação',21,7,148793,4865597,98),
('Terra',21,7,482429,15889054,116),
('Eclipse Oculto',21,7,221936,7382703,106),
('Texto "Verdade Tropical"',21,7,84088,2752161,161),
('Bem Devagar',21,7,133172,4333651,196),
('Drão',21,7,156264,5065932,107),
('Saudosismo',21,7,144326,4726981,158),
('Carolina',21,7,181812,5924159,166),
('Sozinho',21,7,190589,6253200,200),
('Esse Cara',21,7,223111,7217126,182),
('Mel',21,7,294765,9854062,140),
('Linha Do Equador',21,7,299337,10003747,195),
('Odara',21,7,141270,4704104,93),
('A Luz De Tieta',21,7,251742,8507446,104),
('Atrás Da Verd-E-Rosa Só Não Vai Quem Já Morreu',21,7,307252,10364247,148),
('Vida Boa',21,7,281730,9411272,136),
('Sozinho (Hitmakers Classic Mix)',22,7,436636,14462072,77),
('Sozinho (Hitmakers Classic Radio Edit)',22,7,195004,6455134,68),
('Sozinho (Caêdrum  n  Bass)',22,7,328071,10975007,155),
('Carolina',23,7,163056,5375395,114),
('Essa Moça Ta Diferente',23,7,167235,5568574,113),
('Vai Passar',23,7,369763,12359161,165),
('Samba De Orly',23,7,162429,5431854,69),
('Bye, Bye Brasil',23,7,283402,9499590,149),
('Atras Da Porta',23,7,189675,6132843,108),
('Tatuagem',23,7,172120,5645703,183),
('O Que Será (À Flor Da Terra)',23,7,167288,5574848,102),
('Morena De Angola',23,7,186801,6373932,156),
('Apesar De Você',23,7,234501,7886937,89),
('A Banda',23,7,132493,4349539,102),
('Minha Historia',23,7,182256,6029673,78),
('Com Açúcar E Com Afeto',23,7,175386,5846442,161),
('Brejo Da Cruz',23,7,214099,7270749,99),
('Meu Caro Amigo',23,7,260257,8778172,148),
('Geni E O Zepelim',23,7,317570,10342226,93),
('Trocando Em Miúdos',23,7,169717,5461468,97),
('Vai Trabalhar Vagabundo',23,7,139154,4693941,158),
('Gota D água',23,7,153208,5074189,158),
('Construção / Deus Lhe Pague',23,7,383059,12675305,165),
('Mateus Enter',24,7,33149,1103013,175),
('O Cidadão Do Mundo',24,7,200933,6724966,136),
('Etnia',24,7,152555,5061413,103),
('Quilombo Groove [Instrumental]',24,7,151823,5042447,188),
('Macô',24,7,249600,8253934,64),
('Um Passeio No Mundo Livre',24,7,240091,7984291,171),
('Samba Do Lado',24,7,227317,7541688,120),
('Maracatu Atômico',24,7,284264,9670057,101),
('O Encontro De Isaac Asimov Com Santos Dumont No Céu',24,7,99108,3240816,171),
('Corpo De Lama',24,7,232672,7714954,71),
('Sobremesa',24,7,240091,7960868,156),
('Manguetown',24,7,194560,6475159,113),
('Um Satélite Na Cabeça',24,7,126615,4272821,91),
('Baião Ambiental [Instrumental]',24,7,152659,5198539,74),
('Sangue De Bairro',24,7,132231,4415557,171),
('Enquanto O Mundo Explode',24,7,88764,2968650,114),
('Interlude Zumbi',24,7,71627,2408550,161),
('Criança De Domingo',24,7,208222,6984813,105),
('Amor De Muito',24,7,175333,5881293,173),
('Samidarish [Instrumental]',24,7,272431,8911641,178),
('Maracatu Atômico [Atomic Version]',24,7,273084,9019677,89),
('Maracatu Atômico [Ragga Mix]',24,7,210155,6986421,92),
('Maracatu Atômico [Trip Hop]',24,7,221492,7380787,177),
('Banditismo Por Uma Questa',25,7,307095,10251097,116),
('Banditismo Por Uma Questa',25,7,243644,8147224,99),
('Rios Pontes & Overdrives',25,7,286720,9659152,55),
('Cidade',25,7,216346,7241817,92),
('Praiera',25,7,183640,6172781,68),
('Samba Makossa',25,7,271856,9095410,112),
('Da Lama Ao Caos',25,7,251559,8378065,71),
('Maracatu De Tiro Certeiro',25,7,88868,2901397,163),
('Salustiano Song',25,7,215405,7183969,140),
('Antene Se',25,7,248372,8253618,87),
('Risoflora',25,7,105586,3536938,86),
('Lixo Do Mangue',25,7,193253,6534200,130),
('Computadores Fazem Arte',25,7,404323,13702771,147),
('Girassol',26,8,249808,8327676,158),
('A Sombra Da Maldade',26,8,230922,7697230,181),
('Johnny B. Goode',26,8,254615,8505985,126),
('Soldado Da Paz',26,8,194220,6455080,160),
('Firmamento',26,8,222145,7402658,138),
('Extra',26,8,304352,10078050,185),
('O Erê',26,8,236382,7866924,181),
('Podes Crer',26,8,232280,7747747,125),
('A Estrada',26,8,248842,8275673,186),
('Berlim',26,8,207542,6920424,165),
('Já Foi',26,8,221544,7388466,196),
('Onde Você Mora?',26,8,256026,8502588,148),
('Pensamento',26,8,173008,5748424,192),
('Conciliação',26,8,257619,8552474,113),
('Realidade Virtual',26,8,195239,6503533,161),
('Mensagem',26,8,225332,7488852,75),
('A Cor Do Sol',26,8,231392,7663348,111),
('Onde Você Mora?',27,8,298396,10056970,140),
('O Erê',27,8,206942,6950332,87),
('A Sombra Da Maldade',27,8,285231,9544383,74),
('A Estrada',27,8,282174,9344477,138),
('Falar A Verdade',27,8,244950,8189093,199),
('Firmamento',27,8,225488,7507866,193),
('Pensamento',27,8,192391,6399761,176),
('Realidade Virtual',27,8,240300,8069934,122),
('Doutor',27,8,178155,5950952,65),
('Na Frente Da TV',27,8,289750,9633659,128),
('Downtown',27,8,239725,8024386,96),
('Sábado A Noite',27,8,267363,8895073,162),
('A Cor Do Sol',27,8,273031,9142937,137),
('Eu Também Quero Beijar',27,8,211147,7029400,60),
('Noite Do Prazer',28,7,311353,10309980,78),
('À Francesa',28,7,244532,8150846,147),
('Cada Um Cada Um (A Namoradeira)',28,7,253492,8441034,61),
('Linha Do Equador',28,7,244715,8123466,193),
('Amor Demais',28,7,254040,8420093,67),
('Férias',28,7,264202,8731945,103),
('Gostava Tanto De Você',28,7,230452,7685326,59),
('Flor Do Futuro',28,7,275748,9205941,76),
('Felicidade Urgente',28,7,266605,8873358,60),
('Livre Pra Viver',28,7,214595,7111596,58),
('Dig-Dig, Lambe-Lambe (Ao Vivo)',29,9,205479,6892516,108),
('Pererê',29,9,198661,6643207,56),
('TriboTchan',29,9,194194,6507950,100),
('Tapa Aqui, Descobre Ali',29,9,188630,6327391,96),
('Daniela',29,9,230791,7748006,153),
('Bate Lata',29,9,206733,7034985,196),
('Garotas do Brasil',29,9,210155,6973625,82),
('Levada do Amor (Ailoviu)',29,9,190093,6457752,91),
('Lavadeira',29,9,214256,7254147,168),
('Reboladeira',29,9,210599,7027525,55),
('É que Nessa Encarnação Eu Nasci Manga',29,9,196519,6568081,50),
('Reggae Tchan',29,9,206654,6931328,193),
('My Love',29,9,203493,6772813,73),
('Latinha de Cerveja',29,9,166687,5532564,74),
('You Shook Me',30,1,315951,10249958,88),
('I Can t Quit You Baby',30,1,263836,8581414,65),
('Communication Breakdown',30,1,192653,6287257,195),
('Dazed and Confused',30,1,401920,13035765,147),
('The Girl I Love She Got Long Black Wavy Hair',30,1,183327,5995686,114),
('What is and Should Never Be',30,1,260675,8497116,196),
('Communication Breakdown(2)',30,1,161149,5261022,183),
('Travelling Riverside Blues',30,1,312032,10232581,128),
('Whole Lotta Love',30,1,373394,12258175,69),
('Somethin  Else',30,1,127869,4165650,101),
('Communication Breakdown(3)',30,1,185260,6041133,77),
('I Can t Quit You Baby(2)',30,1,380551,12377615,129),
('You Shook Me(2)',30,1,619467,20138673,79),
('How Many More Times',30,1,711836,23092953,139),
('Debra Kadabra',31,1,234553,7649679,193),
('Carolina Hard-Core Ecstasy',31,1,359680,11731061,130),
('Sam With The Showing Scalp Flat Top',31,1,171284,5572993,193),
('Poofter s Froth Wyoming Plans Ahead',31,1,183902,6007019,186),
('200 Years Old',31,1,272561,8912465,138),
('Cucamonga',31,1,144483,4728586,177),
('Advance Romance',31,1,677694,22080051,183),
('Man With The Woman Head',31,1,88894,2922044,73);
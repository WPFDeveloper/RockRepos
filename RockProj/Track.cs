//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RockProj
{
    using System;
    using System.Collections.Generic;
    
    public partial class Track
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int IdAlbum { get; set; }
        public int IdGenre { get; set; }
        public int Duration { get; set; }
        public int Size { get; set; }
        public decimal Price { get; set; }
    
        public virtual Album Album { get; set; }
        public virtual Genre Genre { get; set; }
    }
}

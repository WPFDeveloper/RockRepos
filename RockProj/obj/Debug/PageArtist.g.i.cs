﻿#pragma checksum "..\..\PageArtist.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "A11BD1358BE76BFA82590178A3D0AC9243E55E80EFB6B72BF59B77196DD126D1"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using RockProj;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace RockProj {
    
    
    /// <summary>
    /// PageArtist
    /// </summary>
    public partial class PageArtist : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 12 "..\..\PageArtist.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dataGridArtist;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\PageArtist.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox textBoxTitle;
        
        #line default
        #line hidden
        
        
        #line 21 "..\..\PageArtist.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button buttonAdd;
        
        #line default
        #line hidden
        
        
        #line 22 "..\..\PageArtist.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button buttonDelete;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/RockProj;component/pageartist.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\PageArtist.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.dataGridArtist = ((System.Windows.Controls.DataGrid)(target));
            
            #line 12 "..\..\PageArtist.xaml"
            this.dataGridArtist.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.dataGridArtist_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.textBoxTitle = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.buttonAdd = ((System.Windows.Controls.Button)(target));
            
            #line 21 "..\..\PageArtist.xaml"
            this.buttonAdd.Click += new System.Windows.RoutedEventHandler(this.buttonAdd_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.buttonDelete = ((System.Windows.Controls.Button)(target));
            
            #line 22 "..\..\PageArtist.xaml"
            this.buttonDelete.Click += new System.Windows.RoutedEventHandler(this.buttonDelete_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}


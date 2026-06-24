struct A { a:Int; }
struct B { b:A; }
struct C { c:B; }
struct D { d:C; }
struct E { e:D; }
struct F { f:E; }
struct G { g:F; }

contract Chain {
   field:G;
   init() {
       self.field = G{ g:F{ f:E{ e:D{ d:C{ c:B{ b:A{a:1} } } } } } };
   }
}
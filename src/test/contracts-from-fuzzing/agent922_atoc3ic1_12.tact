struct Lvl1 {a:Int}
struct Lvl2{b:Lvl1}
struct Lvl3{c:Lvl2}
struct Lvl4{d:Lvl3}
struct Lvl5{e:Lvl4}
struct Lvl6{f:Lvl5}
struct Lvl7{g:Lvl6}

contract TestContract {
   deep: Lvl7;

   init() {
      self.deep = Lvl7{ g: Lvl6{ f: Lvl5{ e: Lvl4{ d: Lvl3{ c: Lvl2{ b: Lvl1{ a: 77 } } } } } } };
   }
}
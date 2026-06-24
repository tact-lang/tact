struct Tiny1 { x: Int }
struct Tiny2 { t1a: Tiny1; t1b: Tiny1 }
struct Tiny3 { t2a: Tiny2; t2b: Tiny2 }
struct Tiny4 { t3a: Tiny3; t3b: Tiny3 }

contract BranchTree {
  root: Tiny4;

  init() {
    self.root = Tiny4{
      t3a: Tiny3{
        t2a: Tiny2{ t1a:Tiny1{x:1}, t1b:Tiny1{x:2} },
        t2b: Tiny2{ t1a:Tiny1{x:3}, t1b:Tiny1{x:4} }
      },
      t3b: Tiny3{
        t2a: Tiny2{ t1a:Tiny1{x:5}, t1b:Tiny1{x:6} },
        t2b: Tiny2{ t1a:Tiny1{x:7}, t1b:Tiny1{x:8} }
      }
    };
  }
}
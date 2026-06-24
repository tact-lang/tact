struct ManyNesting {
    x1: Level1;
    x2: Level1;
}

struct Level1 {
  b: Bool;
  lvl2: Level2;
}
struct Level2 {
 c: Int;
 lvl3: Level3;
}
struct Level3 {
 s: String;
}

contract ManyNestedContract {
    foo: ManyNesting;
    init() {
        self.foo = ManyNesting{ x1: Level1{ b:true, lvl2: Level2{c:123,lvl3:Level3{s:"x"}} }, x2: Level1{ b:false, lvl2: Level2{c:321,lvl3:Level3{s:"y"}} } };
    }
}
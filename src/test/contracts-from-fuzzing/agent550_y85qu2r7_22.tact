struct S1 {
 a: Int;
 b: Bool;
}

struct S2 {
 x: S1;
 y: Int;
}

contract NestedStructTest {
 s: S2;

 init() {
    self.s = S2{ x: S1{a: 1, b:true}, y:2 };
 }
}
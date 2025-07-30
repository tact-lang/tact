struct S1 {
 x: Int;
 y: String;
 z: Bool;
}

contract InitDifferent {
 p: S1;
 q: Int;
 r: String;
 s: Bool;

 init() {
 self.p = S1{ x: 123, y: "abc", z: false };
 self.q = 5;
 self.r = "hello";
 self.s = true;
 }
}

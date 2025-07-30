struct S {
 x: Int;
 y: String;
 z: Bool?;
}

contract NestedStructList {
 a: S;
 b: S;
 c: S;

 init() {
 self.a = S{ x: 1, y: "a", z: null };
 self.b = S{ x: 2, y: "b", z: true };
 self.c = S{ x: 3, y: "c", z: false };
 }
}
struct Rec1 {
 x: Int;
}
struct Rec2 {
 y: Bool;
 rec: Rec1;
}
struct Rec3 {
 z: String;
 rec2: Rec2;
}

contract RecursionChain {
 root: Rec3;
 init() {
  self.root = Rec3{
    z: "hi",
    rec2: Rec2{
      y: true,
      rec: Rec1{ x: 9 }
    }
  };
 }
}
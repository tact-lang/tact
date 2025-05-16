struct Rec1 { x: Int; y: Bool; z: String; }

struct Rec2 { p: Rec1; q: Rec1; r: Int; }

struct Rec3 { m: Rec2; n: Rec2; foo: Bool; }

contract MultiNest {
  data: Rec3;

  init() {
    self.data = Rec3 {
      m: Rec2 { p: Rec1 { x:1, y:true, z:"a" }, q: Rec1 { x:2, y:false, z:"b" }, r:3 },
      n: Rec2 { p: Rec1 { x:4, y:true, z:"c" }, q: Rec1 { x:5, y:false, z:"d" }, r:6 },
      foo: true
    };
  }
}
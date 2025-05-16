// Deep struct nesting with different primitive types
struct Deep1 {
  a: Int;
  b: Bool;
}

struct Deep2 {
  c: String;
  d: Deep1;
}

struct Deep3 {
  e: Slice;
  f: Deep2;
}

struct Deep4 {
  g: Deep3;
  h: Cell;
}

contract DeepNest {
  z: Deep4;
  init() {
    self.z = Deep4{
      g: Deep3{
        e: emptyCell().asSlice(),
        f: Deep2{
          c: "hi",
          d: Deep1{ a:1, b:true }
        }
      },
      h: emptyCell()
    };
  }
}
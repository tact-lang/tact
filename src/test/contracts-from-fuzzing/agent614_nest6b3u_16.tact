struct Alpha {
  a: Int;
  b: Bool;
  c: String?;
}

struct Beta {
  d: Int;
  e: String;
}

struct Gamma {
  f: Bool;
  g: Beta;
}

struct Delta {
  h: String;
  i: Alpha;
  j: Gamma?;
}

contract NestedMany {
  data: Delta;

  init() {
    self.data = Delta{
      h: "hello",
      i: Alpha{ a:1, b:true, c:null },
      j: Gamma{
        f:false,
        g: Beta{d:5, e:"beta"}
      }
    };
  }
}
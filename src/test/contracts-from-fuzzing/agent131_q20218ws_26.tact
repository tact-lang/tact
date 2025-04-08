struct Alpha {
  a: Int;
  b: Bool;
}

struct Beta {
  c: Int?;
  d: String;
}

struct Gamma {
  e: Alpha;
  f: Beta;
}

contract EmbedMulti {
  g: Gamma;

  init() {
    self.g = Gamma{
      e: Alpha{ a:5, b:false },
      f: Beta{ c:null, d:"hello" }
    };
  }
}
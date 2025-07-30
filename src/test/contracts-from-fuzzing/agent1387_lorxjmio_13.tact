struct Combo {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String;
 g: Int;
 h: Bool;
}

contract TestContract {
  state: Combo;

  init() {
    self.state = Combo{
      a:1, b:true, c:"abc", d:null, e:false, f:"def", g:42, h:false
    };
  }
}
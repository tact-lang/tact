struct ManyStrings {
  a: String; b: String; c: String; d: String; e: String;
}

contract StringHeavy {
  s: ManyStrings;

  init() {
    self.s = ManyStrings{
      a:"1",b:"2",c:"3",d:"4",e:"5"
    };
  }
}
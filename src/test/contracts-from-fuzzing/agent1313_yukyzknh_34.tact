struct Embedded {
  s: String;
  b: Bool;
  i: Int;
}

contract EmbedStructDefault {
  e: Embedded = Embedded{s:"hi",b:true,i:42};

  init() {
    self.e = Embedded{s:"q",b:false,i:10};
  }
}
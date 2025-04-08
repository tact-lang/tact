struct Layer1 {
  a: Int;
  b: Bool;
}

struct Layer2 {
  l: Layer1;
  c: String;
}

struct Layer3 {
  m: Layer2;
  d: Address;
}

contract DeepEmbed {
  val: Layer3;

  init() {
    self.val = Layer3{
      m: Layer2{
        l: Layer1{a:1,b:true},
        c: "x"
      },
      d: myAddress()
    };
  }
}
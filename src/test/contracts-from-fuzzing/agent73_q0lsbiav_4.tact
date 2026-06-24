struct Inner {
  x1: Int?;
  x2: Bool;
  x3: String?;
  x4: Address;
}

struct Outer {
  a1: Inner;
  a2: Inner;
  a3: Inner;
  a4: Inner;
  a5: Inner;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      a1: Inner{ x1:null, x2:true, x3:"abc", x4:myAddress() },
      a2: Inner{ x1:1, x2:false, x3:null, x4:myAddress() },
      a3: Inner{ x1:2, x2:true, x3:"def", x4:myAddress() },
      a4: Inner{ x1:3, x2:false, x3:null, x4:myAddress() },
      a5: Inner{ x1:4, x2:true, x3:"ghi", x4:myAddress() }
    };
  }
}

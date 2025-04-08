struct WideA {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Address;
}
struct WideB {
  f5: Int?;
  f6: Bool?;
  f7: String?;
  f8: Address?;
}

struct Combined {
  a: WideA;
  b: WideB;
}

contract ComplexRecord {
  rec: Combined;

  init() {
    self.rec = Combined{
      a: WideA{f1:1,f2:true,f3:"ok",f4:myAddress()},
      b: WideB{f5:null,f6:true,f7:null,f8:null}
    };
  }
}
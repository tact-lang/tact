struct LongNested {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  s: String;
}

struct Holder {
  one: LongNested;
  two: LongNested;
}

contract Layered {
  val: Holder;

  init() {
    self.val = Holder{
      one: LongNested{ a:1,b:true,c:null,d:null,s:"x" },
      two: LongNested{ a:2,b:false,c:null,d:null,s:"y" }
    };
  }
}

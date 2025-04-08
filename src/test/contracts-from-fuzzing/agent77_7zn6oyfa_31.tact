struct Rec{
 a: Int;
 b: Bool;
}

struct HasRec{
 r: Rec;
 x: Int;
}

contract StructInStruct {
 s: HasRec;
 init() {
    self.s = HasRec {
      r: Rec{ a:123, b:false },
      x: 55
    };
 }
}
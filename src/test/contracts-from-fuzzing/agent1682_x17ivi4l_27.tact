struct RecStruct1 {
  val: Int;
}

struct RecStruct2 {
  part: RecStruct1?;
}

struct RecStruct3 {
  piece: RecStruct2?;
}

contract TestContract {
  rec: RecStruct3;

  init() {
    self.rec = RecStruct3{
      piece: null
    };
  }
}
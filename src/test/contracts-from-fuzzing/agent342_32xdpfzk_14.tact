struct RecOptional {
  val: Int?;
}

struct RecStruct {
  child: RecOptional?;
}

contract Test13 {
  rec: RecStruct;

  init() {
    self.rec = RecStruct{
      child: RecOptional{
        val: 100
      }
    };
  }
}
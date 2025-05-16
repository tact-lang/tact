struct DataHolder {
  i: Int;
  s: String;
  optionalStr: String?;
}

contract OptionalInStruct {
  val: DataHolder;

  init() {
    self.val = DataHolder{i:7,s:"x",optionalStr:null};
  }
}

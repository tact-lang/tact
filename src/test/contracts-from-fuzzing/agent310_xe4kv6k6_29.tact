struct Outerwrap {
  opt: Innerwrap?;
}
struct Innerwrap {
  deep: Int; 
}

contract OptionalsWrappingOptionalsStruct {
  field: Outerwrap;
  init() {
    self.field = Outerwrap{
      opt: Innerwrap{deep: 5}
    };
  }
}
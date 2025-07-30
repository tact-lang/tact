struct DeepOpt {
  a: Int?;
  b: Int?;
}

struct Top {
  left: DeepOpt?;
  right: DeepOpt?;
}

contract NestedOptionalFields {
  val: Top?;
  init(){self.val=null;}
}
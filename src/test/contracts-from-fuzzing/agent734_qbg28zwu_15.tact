struct InlineOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestContract {
  data: InlineOpt = InlineOpt{ a:null, b:true, c:"hello" };
}
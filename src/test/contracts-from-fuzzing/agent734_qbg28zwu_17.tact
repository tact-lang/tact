struct Bunch {
  a: Int;
  b: String?;
  c: Bool;
  d: Int?;
}

contract TestContract {
  p: Bunch = Bunch{ a:1, b:null, c:true, d:null };
}
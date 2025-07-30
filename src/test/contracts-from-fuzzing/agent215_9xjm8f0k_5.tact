struct Opts {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptContract {
  opts: Opts = Opts{a: null, b: true, c: null};
}
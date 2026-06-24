struct Opts { a:Int?; b:Int?; c:Int?; d:Int?; }

contract AllNullOpt {
  o: Opts;

  init() {
    self.o = Opts{ a:null, b:null, c:null, d:null };
  }
}

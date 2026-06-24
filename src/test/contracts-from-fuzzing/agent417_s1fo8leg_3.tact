struct Opts {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestContract {
    opts: Opts;
    
    init() {
        self.opts = Opts{
            a: 42,
            b: true,
            c: "hello"
        };
    }
}
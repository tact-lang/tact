struct StructOpt {
  inner: Int?;
}

contract VarInitOpt {
    s: StructOpt;
    init() {
        self.s = StructOpt{ inner: null };
    }
    receive() {}
}
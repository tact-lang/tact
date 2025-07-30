struct RecOpt {
  x: Int?;
}

contract WriteNullToOpt {
    rec: RecOpt;

    init() {
        self.rec = RecOpt{ x: null };
    }
}
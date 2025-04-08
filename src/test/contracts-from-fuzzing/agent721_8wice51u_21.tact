struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
}

contract Options {
    f: ManyOpts = ManyOpts{
      a: null,
      b: true,
      c: null,
      d: 42,
      e: "hi"
    };
}
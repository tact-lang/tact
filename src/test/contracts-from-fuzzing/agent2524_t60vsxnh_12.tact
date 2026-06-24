struct AllOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract AllNulls {
    data: AllOpts = AllOpts{
      a: null,
      b: null,
      c: null,
      d: null,
    };
}
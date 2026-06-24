struct ManyFields {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Int as int64;
  h: Bool;
  i: String;
  j: Int?;
}

contract MultiTypeFields {
  rec: ManyFields = ManyFields{
    a: 1,
    b: true,
    c: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
    d: cell("te6cckEBAQEAAgAAAEysuc0="),
    e: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
    f: "abc",
    g: 123,
    h: false,
    i: "xyz",
    j: null,
  };
  init() {}
}

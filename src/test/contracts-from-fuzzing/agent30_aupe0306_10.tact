struct Flat {
    a: Int;
    b: Int;
    c: Int;
}

contract FlatDefaults {
    data: Flat = Flat{
      a: 1,
      b: 2,
      c: 3
    };
}
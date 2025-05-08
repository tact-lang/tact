struct Nested {
  x: Int;
  y: Bool?;
  s: String;
}

struct Outer {
  n: Nested;
  flag: Bool;
}

contract C {
  data: Outer = Outer{
    n: Nested{
      x: 1,
      y: true,
      s: "hi"
    },
    flag: false
  };
}
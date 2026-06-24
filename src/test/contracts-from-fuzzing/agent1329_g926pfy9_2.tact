struct Nested {
  innermost: Int as int64;
  flag: Bool;
  text: String;
}

struct Mid {
  nest: Nested;
  optVal: Int?;
  flag: Bool;
}

struct Top {
  m: Mid;
  val: Int;
}

contract DeepOpts {
  deepParam: Top = Top{
    m: Mid{
      nest: Nested{
        innermost: 123,
        flag: true,
        text: "hello",
      },
      optVal: null,
      flag: false,
    },
    val: 99,
  };
  init() {}
}

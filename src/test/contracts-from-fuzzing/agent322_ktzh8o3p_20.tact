struct Inner {
  msg: String;
}

struct Outer {
  prefix: String;
  inner: Inner;
}

contract LongStrings {
  s: Outer = Outer{
    prefix: "hello world! 123456789012345678901234567890",
    inner: Inner{ msg: "another long message abcdefghijklmnopqrstuvwxyz0123456789" }
  };
}
struct Struc {
  a: Int;
  b: String;
}

contract Defaults {
  foo: Struc = Struc{
    a: 5,
    b: "hello"
  };
}
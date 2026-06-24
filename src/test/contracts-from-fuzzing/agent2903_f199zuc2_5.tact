struct Params {
  s: String;
  flag: Bool?;
  z: Int?;
  neg: Bool;
}

contract OptionalTest {
  p: Params = Params{
    s: "hello",
    flag: null,
    z: null,
    neg: false
  };
}
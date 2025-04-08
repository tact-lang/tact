struct Inner {
  id: Int?;
  flag: Bool;
  text: String;
}

struct OuterOpt {
  nested: Inner?;
}

contract ParamDeepOpt(
  envelope: OuterOpt,
) {
  receive() {
    dump(0);
  }
}
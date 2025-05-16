struct Sub {
  x: Int;
  y: Bool?;
}

struct Container {
  sub: Sub;
  note: String?;
}

contract ParamInit(
  data: Container,
) {
  receive() {
    let _ = self.data.sub.x;
  }
}

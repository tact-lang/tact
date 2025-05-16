struct S1 {
  x: Int;
}

struct S2 {
  y: S1;
}

struct S3 {
  z: S2;
}

contract ChainEmbed {
    st: S3;

    init() {
        self.st = S3{ z: S2{ y: S1{ x: 17 }}};
    }
}

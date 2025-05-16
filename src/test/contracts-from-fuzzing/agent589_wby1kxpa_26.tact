struct Foo {
  a: Int;
  b: String;
}

contract DefaultsOpt {
    f: Foo?;

    init() {
        self.f = null;
    }
}
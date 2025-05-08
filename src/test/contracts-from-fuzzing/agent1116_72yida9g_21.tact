struct Deep1 {
    x: Int;
}

struct Deep2 {
    y: Deep1;
}

struct Deep3 {
    z: Deep2;
}

contract DeepPersist {
    record: Deep3;

    init() {
      self.record = Deep3{ z: Deep2{ y: Deep1{ x: 999 } } };
    }
}
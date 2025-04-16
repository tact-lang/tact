struct MultipleNested {
  i1: Inner;
  i2: Inner;
  i3: Inner;
}

struct Inner {
    sval: Int;
}

contract MultiNestedContract {
    m: MultipleNested;

    init() {
        self.m = MultipleNested{
            i1: Inner{sval:1},
            i2: Inner{sval:2},
            i3: Inner{sval:3}
        };
    }
}

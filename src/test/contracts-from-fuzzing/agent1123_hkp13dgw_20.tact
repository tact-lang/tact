struct X {
  foo: Int;
}

struct Y {
  bar: X;
}

struct Z {
  baz: Y;
}

contract NestedVariety {
    item1: X;
    item2: Y;
    item3: Z;
    flag: Bool?;
    note: String;
    optNote: String?;

    init() {
        self.item1 = X{foo:1};
        self.item2 = Y{bar:X{foo:2}};
        self.item3 = Z{baz:Y{bar:X{foo:3}}};
        self.flag = null;
        self.note = "nested";
        self.optNote = null;
    }
}
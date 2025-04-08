struct Layer3 {
    val: Int;
}

struct Layer2 {
    nested: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

struct Root {
    nested: Layer1;
    flag1: Bool;
    flag2: Bool;
    msg: String;
}

contract VeryNested {
    storage: Root;

    init() {
        self.storage = Root{
            nested: Layer1{ nested: Layer2{ nested: Layer3{ val: 32 } } },
            flag1: true,
            flag2: false,
            msg: "ok"
        };
    }
}
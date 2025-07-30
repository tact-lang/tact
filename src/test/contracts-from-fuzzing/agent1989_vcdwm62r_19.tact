struct Inner1 {
    val: Int;
}

struct Inner2 {
    flag: Bool;
}

struct Inner3 {
    txt: String;
}

struct ComboNest {
    in1: Inner1;
    in2: Inner2;
    in3: Inner3;
}

contract MultiInnerLayers {
    data: ComboNest;

    init() {
        self.data = ComboNest{
            in1: Inner1{ val: 1 },
            in2: Inner2{ flag: true },
            in3: Inner3{ txt: "zz" },
        };
    }
}
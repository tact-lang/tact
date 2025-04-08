struct InfoA {
    x: Int;
    y: Int;
}

struct InfoB {
    z: Bool;
    label: String;
}

struct ComboOpt {
    a: InfoA?;
    b: InfoB?;
}

contract MultiOptNested {
    storage: ComboOpt;

    init() {
        self.storage = ComboOpt{
            a: null,
            b: null
        };
    }
}

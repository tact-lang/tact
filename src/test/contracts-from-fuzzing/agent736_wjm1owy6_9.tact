struct OptionDeep {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: String?;
    d: Bool?;
}

contract TestContract {
    field: OptionDeep = OptionDeep{a:null, b:null};

    init() {
        self.field = OptionDeep{a:null, b:null};
    }

    receive() {
        dump(self.field.a);
    }
}
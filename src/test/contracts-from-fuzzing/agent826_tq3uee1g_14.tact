struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

contract ComboFields {
    all: ManyFields;

    init() {
        self.all = ManyFields{
            f1: 10, f2: true, f3: "hi", f4: null, f5: false, f6: null
        };
    }
}
struct SOption {
    field: Int?;
}

struct SDefault {
    field: Int = 5;
}

struct SNested {
    opt: SOption;
    def: SDefault;
}

contract MixedDefaults {
    store: SNested;

    init() {
        self.store = SNested{
            opt: SOption{field: null},
            def: SDefault{}
        };
    }
}
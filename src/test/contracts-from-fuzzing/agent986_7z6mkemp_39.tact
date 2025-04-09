struct DefaultsDeep {
    nested: Int?;
}

contract DefaultsNullNested {
    d: DefaultsDeep = DefaultsDeep{nested:null};

    init() {
        self.d = DefaultsDeep{nested:null};
    }
}

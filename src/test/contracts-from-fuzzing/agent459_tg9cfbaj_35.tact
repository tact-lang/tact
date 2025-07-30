struct NestedOpt {
    innerVal: Int?;
}

struct Top {
    maybe: NestedOpt?;
}

contract UninitializedDeepOptionals {
    state: Top = Top{
        maybe: null
    };

    init() {
        self.state = Top{
            maybe: NestedOpt{ innerVal: 123 }
        };
    }
}
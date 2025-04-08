struct OptionDeep {
    x: Inner?;
}

struct Inner {
    y: Innermost?;
}

struct Innermost {
    z: String?;
}

contract DeepNestedOptionals {
    f: OptionDeep;

    init() {
        self.f = OptionDeep{
            x: Inner{
                y: Innermost{
                    z: null
                }
            }
        };
    }
}

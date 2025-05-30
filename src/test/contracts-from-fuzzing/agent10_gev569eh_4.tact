struct NestedOptional {
    s: Optionals?;
}

struct Optionals {
    a: Int?;
    b: Bool?;
}

contract DeepOpt {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            s: Optionals{
                a: null,
                b: null
            }
        };
    }
}
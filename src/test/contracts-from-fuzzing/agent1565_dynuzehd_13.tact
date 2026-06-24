struct NestedOptional {
    nest: InnerOption?;
}

struct InnerOption {
    text: String?;
    bit: Bool;
}

contract OptionalDeep {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            nest: InnerOption{
                text: null,
                bit: true,
            }
        };
    }
}
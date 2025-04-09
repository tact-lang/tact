struct InnerMost {
    field: Int?;
}

struct Middle {
    nested: InnerMost?;
}

struct Outer {
    midOption: Middle?;
    label: String;
}

contract ChainOptionalNested {
    data: Outer;

    init() {
        self.data = Outer{
            midOption: null,
            label: "test"
        };
    }
}

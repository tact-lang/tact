struct Inner {
    num: Int;
    optionalText: String?;
}

struct Middle {
    innerField: Inner;
    enabled: Bool;
}

struct Outer {
    middleField: Middle;
    description: String;
}

contract DeepNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            middleField: Middle{
                innerField: Inner{
                    num: 123,
                    optionalText: null
                },
                enabled: false
            },
            description: "deep"
        };
    }
}
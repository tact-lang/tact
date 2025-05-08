struct InnerMost {
    flag: Bool;
    number: Int;
    comment: String?;
}

struct Middle {
    info: InnerMost;
    extra: Int?;
    more: Bool;
}

struct Outer {
    container: Middle;
    description: String;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            container: Middle{
                info: InnerMost{
                    flag: true,
                    number: 42,
                    comment: "hi"
                },
                extra: null,
                more: false
            },
            description: "ok"
        };
    }
}

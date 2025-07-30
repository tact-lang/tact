struct Outer {
    innerOpt: Inner?;
    flag: Bool;
}

struct Inner {
    value: Int;
    nestedOpt: Deep?
}

struct Deep {
    label: String;
}

contract NestedOptionalFields {
    complex: Outer;

    init() {
        self.complex = Outer{
            innerOpt: Inner{
                value: 10,
                nestedOpt: Deep{
                    label: "hi"
                }
            },
            flag: true
        };
    }
}

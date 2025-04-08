struct InnerMost {
    first: Int;
    second: Bool;
    third: String;
}

struct Middle {
    nested: InnerMost;
    flag: Bool;
    text: String;
}

struct Outer {
    complex: Middle;
    optionalComplex: Middle?;
}

contract TestContract {
    fullStruct: Outer;

    init() {
        self.fullStruct = Outer{
            complex: Middle{
                nested: InnerMost{first: 1, second: true, third: "hi"},
                flag: false,
                text: "hello"
            },
            optionalComplex: null
        };
    }
}

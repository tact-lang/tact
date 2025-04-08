struct ComplexInner {
    flag: Bool;
    nestedOpt: NestedOpt?;
}

struct NestedOpt {
    text: String;
    optionalInt: Int?;
}

struct Outer {
    number: Int;
    innerStruct: ComplexInner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            number: 17,
            innerStruct: ComplexInner{
                flag: false,
                nestedOpt: NestedOpt{
                    text: "hello",
                    optionalInt: null
                }
            }
        };
    }
}

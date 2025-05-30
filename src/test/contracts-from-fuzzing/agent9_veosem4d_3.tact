struct ComplexInner {
    name: String = "test";
    flag: Bool = true;
    count: Int = 42;
    optInt: Int?;
    optBool: Bool?;
    nested: Simple;
}

struct Simple {
    x: Int;
}

contract NestedStructOpt {
    data: ComplexInner;

    init() {
        self.data = ComplexInner{
            name: "hi",
            flag: true,
            count: 10,
            optInt: null,
            optBool: null,
            nested: Simple{ x: 5 }
        };
    }
}
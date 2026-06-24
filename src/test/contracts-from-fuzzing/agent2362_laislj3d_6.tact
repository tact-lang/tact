struct HasOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

struct ContainsOptionals {
    x: Int;
    nestedOpt: HasOptionals;
}

contract NestedOptionalTest {
    myField: ContainsOptionals;

    init() {
        self.myField = ContainsOptionals{
            x: 123,
            nestedOpt: HasOptionals{
                o1: null,
                o2: null,
                o3: "hello"
            }
        };
    }
}
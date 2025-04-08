struct NestedOne {
    innerOne: Int;
    innerTwo: String?;
}

struct NestedTwo {
    first: NestedOne;
    second: NestedOne?;
}

contract TestContract {
    data: NestedTwo;

    init() {
        self.data = NestedTwo{
            first: NestedOne{
                innerOne: 1,
                innerTwo: null
            },
            second: null
        };
    }
}

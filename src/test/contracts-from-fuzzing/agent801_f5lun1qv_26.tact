struct Child {
    val: Int;
}

struct Parent {
    first: Child;
    second: Child;
    third: Child;
}

contract MultiChildContract {
    field: Parent;

    init() {
        self.field = Parent{
            first: Child{ val: 1 },
            second: Child{ val: 2 },
            third: Child{ val: 3 }
        };
    }
}
struct NestedOne {
    inn: Int;
}

struct NestedTwo {
    first: NestedOne;
    second: Int;
}

contract NestedMix {
    data: NestedTwo;

    init() {
        self.data = NestedTwo{first: NestedOne{inn:7}, second:8};
    }
}
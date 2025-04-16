struct Child {
    value: Int;
}

struct Parent {
    first: Child;
    second: Child;
    third: Child;
    fourth: Child;
}

contract MultiStruct {
    p: Parent = Parent{
        first: Child{value: 1},
        second: Child{value: 2},
        third: Child{value: 3},
        fourth: Child{value: 4}
    };
    init() {}
}
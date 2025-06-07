struct Child {
    x: Int;
    flag: Bool;
    note: String;
}

struct Parent {
    id: Int;
    data: Child;
    comment: String;
}

contract NestedStructStorage {
    parent: Parent = Parent{
        id: 1,
        data: Child{x:2, flag:true, note:"hi"},
        comment: "test"
    };
}
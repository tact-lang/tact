struct Leaf {
    flag: Bool?;
    note: String?;
}

struct Wrapper {
    leaf: Leaf?;
    number: Int;
}

contract NestedOptionals {
    data: Wrapper = Wrapper{
        leaf: null,
        number: 5
    };
}
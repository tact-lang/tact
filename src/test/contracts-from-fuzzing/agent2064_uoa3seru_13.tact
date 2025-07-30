struct NestedMulti1 {
    f: Int;
}

struct NestedMulti2 {
    s: String;
    n: NestedMulti1;
}

contract MultiNested {
    a: NestedMulti2 = NestedMulti2{
        s: "",
        n: NestedMulti1{ f: 0 }
    };

    b: NestedMulti2 = NestedMulti2{
        s: "X",
        n: NestedMulti1{ f: 1 }
    };
}

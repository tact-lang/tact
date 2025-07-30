struct Leaf {
    val: Int;
}

struct Container {
    leaf: Leaf?;
    note: String;
}

contract NestedOptionals {
    c: Container? = null;

    init() {
        self.c = Container{
            leaf: Leaf{ val:42 },
            note: "hi"
        };
    }

    receive() {}
}
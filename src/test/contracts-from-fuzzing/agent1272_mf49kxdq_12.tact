struct Leaf {
    val: Int;
}

struct Container {
    inner: Leaf;
    opt: Leaf?;
}

contract NestedContainingOptional {
    data: Container;

    init() {
        self.data = Container{
            inner: Leaf{ val: 1 },
            opt: null
        };
    }
}
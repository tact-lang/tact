struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
}

struct Container {
    inner: ManyOptionals?;
}

contract NestedManyOptionals {
    c: Container;

    init() {
        self.c = Container{inner: null};
    }
}
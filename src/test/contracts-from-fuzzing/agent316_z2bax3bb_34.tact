struct Leaf {
    id: Int as uint32;
    suffix: Slice as remaining;
}

struct Container {
    core: Leaf;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            core: Leaf{
                id: 42,
                suffix: emptyCell().asSlice()
            }
        };
    }
}

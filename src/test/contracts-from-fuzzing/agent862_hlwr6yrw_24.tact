struct OuterRem {
    id: Int;
    tail: Slice as remaining;
}

struct Wrapper {
    content: OuterRem;
}

contract RemInNested {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            content: OuterRem{
                id: 55,
                tail: emptyCell().asSlice()
            }
        };
    }
}

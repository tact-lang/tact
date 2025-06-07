struct Sub {
    a: Int;
    s: Slice as remaining;
}

struct Wrapper {
    first: Int;
    sub: Sub;
}

contract NestedRemainingFieldTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            first: 1,
            sub: Sub{
                a: 2,
                s: emptyCell().asSlice(),
            },
        };
    }
}

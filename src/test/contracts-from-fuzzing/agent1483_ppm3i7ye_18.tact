struct BigNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    inner4: Address;
    inner5: Slice;
}

struct Wrapper {
    first: BigNested;
    second: BigNested;
}

contract RepeatedStructs {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            first: BigNested{
                inner1: 1,
                inner2: true,
                inner3: "a",
                inner4: myAddress(),
                inner5: emptyCell().asSlice()
            },
            second: BigNested{
                inner1: 2,
                inner2: false,
                inner3: "b",
                inner4: myAddress(),
                inner5: emptyCell().asSlice()
            }
        };
    }
}
struct DeepNested {
    inner1: String;
    inner2: Slice;
    inner3: Cell;
}

struct Wrapper {
    nested: DeepNested;
    flag: Bool;
}

contract NestedStore {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: DeepNested{
                inner1: "abc",
                inner2: emptyCell().asSlice(),
                inner3: emptyCell(),
            },
            flag: true,
        };
    }

    receive() {
        self.data = self.data;
    }
}
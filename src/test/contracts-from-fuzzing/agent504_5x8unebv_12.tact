struct NestedSliceStruct {
    part: Slice;
    txt: String;
}

struct Container {
    inner: NestedSliceStruct;
    flag: Bool;
}

contract NestedSlice {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedSliceStruct{
                part: emptyCell().asSlice(),
                txt: "hi",
            },
            flag: true,
        };
    }

    receive() {
        let d = self.data;
    }
}
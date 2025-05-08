struct SliceWrap {
    info: Int;
    tail: Slice as remaining;
}

struct Container {
    wrap: SliceWrap;
    label: String;
}

contract RemainSlice {
    data: Container;

    init() {
        self.data = Container{
            wrap: SliceWrap{
                info: 1,
                tail: emptyCell().asSlice()
            },
            label: "rem"
        };
    }
}
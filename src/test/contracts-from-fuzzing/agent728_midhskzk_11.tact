struct TailData {
    head: Int;
    rest: Slice as remaining;
}

contract SliceTail {
    data: TailData;

    init() {
        self.data = TailData{
            head: 5,
            rest: "hello".asComment().asSlice()
        };
    }
}
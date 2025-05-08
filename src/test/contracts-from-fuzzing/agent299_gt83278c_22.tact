struct SliceStruct {
    s: Slice?;
    i: Int;
    b: Bool?;
}

contract TestContract {
    data: SliceStruct;

    init() {
        self.data = SliceStruct{
            s: null,
            i: 123,
            b: true
        };
    }
}
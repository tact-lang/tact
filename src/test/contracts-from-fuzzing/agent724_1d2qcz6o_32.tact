struct Weird {
    id: Int as uint32;
    opt: Int? as uint8;
    comment: Slice as remaining;
}

contract TestContract {
    w: Weird;

    init() {
        self.w = Weird{
            id: 1,
            opt: null,
            comment: "fuzz".asComment().asSlice()
        };
    }
}
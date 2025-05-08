struct Diverse {
    a: Int as uint32;
    b: Int;
    part: Slice as remaining;
}

contract SerializeDiversity {
    d: Diverse;

    init() {
        self.d = Diverse{
            a: 123456,
            b: -1,
            part: emptyCell().asSlice()
        };
    }
}

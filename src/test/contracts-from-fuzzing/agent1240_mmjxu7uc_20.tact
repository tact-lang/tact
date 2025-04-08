contract StructWithRemaining {
    data: S;

    init() {
        self.data = S{
            id: 42,
            data: "rest".asSlice()
        };
    }
}

struct S {
    id: Int;
    data: Slice as remaining;
}

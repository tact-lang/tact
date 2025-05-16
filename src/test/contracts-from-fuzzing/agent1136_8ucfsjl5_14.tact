contract RemainingTailTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            header: 100,
            payload: "payload".asComment().asSlice()
        };
    }
}

struct Wrapper {
    header: Int as uint32;
    payload: Slice as remaining;
}

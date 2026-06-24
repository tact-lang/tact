message(0x1) Empty1 {}
message(0x2) Empty2 {}

struct Wrapper {
    em1: Empty1;
    em2: Empty2;
}

contract TestWrapEmptyMsgs {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            em1: Empty1{},
            em2: Empty2{}
        };
    }
}

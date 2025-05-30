// Deep optional message inside nested structs
message(0x12233445) Sample {}

struct InnerMost {
    msg: Sample?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract TestDeepOptMsg {
    data: Outer;
    init() {
        self.data = Outer{ mid: null };
    }
}
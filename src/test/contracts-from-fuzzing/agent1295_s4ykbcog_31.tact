// struct with optional message nested
message(0x55) NestedMsg {
    bar: Int;
}

struct Container {
    inner: NestedMsg?;
}

contract NestedMsgOpt {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedMsg{ bar: 100 }
        };
    }
}
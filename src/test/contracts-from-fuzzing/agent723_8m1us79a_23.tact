struct Inner {
    foo: Int;
}

message(0x100) ContainNested {
    inner: Inner;
    bar: Bool;
}

contract TestContract {
    m: ContainNested;

    init() {
        self.m = ContainNested{
            inner: Inner{
                foo: 5,
            },
            bar: true,
        };
    }

    receive() {}
}
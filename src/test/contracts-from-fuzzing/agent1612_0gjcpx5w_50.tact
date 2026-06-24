// test optional address with default null, nested in another
struct Bar {
    addr: Address? = null;
}

contract DefaultNullOptAddr {
    data: Bar;

    init() {
        self.data = Bar{};
    }
}

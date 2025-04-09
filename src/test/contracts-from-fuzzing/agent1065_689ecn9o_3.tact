struct HasDefault {
    foo: Int = 42;
    bar: Bool;
}

contract DefaultStructTest {
    data: HasDefault;
    init() {
        self.data = HasDefault{ bar: true };
    }
}
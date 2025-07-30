struct PartialDefault {
    a: Int;
    b: Int = 42;
    c: Int;
}

contract PartialDefaultTest {
    data: PartialDefault;

    init() {
        self.data = PartialDefault{
            a: 5,
            c: 7
        };
    }
}
struct Ann {
    small: Int as uint8;
    flag: Bool;
}

struct Container {
    inner: Ann;
}

contract SerializeTest {
    c: Container;

    init() {
        self.c = Container{
            inner: Ann{ small: 255, flag: true }
        };
    }
    receive() {}
}
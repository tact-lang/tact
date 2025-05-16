struct Tiny {
    f: Int as uint4;
}

contract TinyFieldTest {
    storage: Tiny;

    init() {
        self.storage = Tiny{ f: 7 };
    }
}

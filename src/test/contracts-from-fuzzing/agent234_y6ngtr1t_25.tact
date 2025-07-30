// Testing optional of struct that has serialization
struct SerOpt {
    foo: Int as uint8;
    bar: Int as int64;
}

contract OptFieldTest {
    val: SerOpt?;

    init() {
        self.val = null;
    }
}
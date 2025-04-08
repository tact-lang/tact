struct OptNested {
    num: Int?;
    flag: Bool?;
    inner: Inner?;
}

struct Inner {
    val: Int;
    txt: String;
}

contract OptionalTest {
    storage: OptNested;

    init() {
        self.storage = OptNested{
            num: null,
            flag: null,
            inner: null
        };
    }
}

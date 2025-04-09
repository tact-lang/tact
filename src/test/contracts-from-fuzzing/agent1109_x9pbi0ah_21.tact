struct Inner {
    num: Int;
}

struct MidOptional {
    inner: Inner?;
    flag: Bool;
}

contract MidOptionalTest {
    data: MidOptional;

    init() {
        self.data = MidOptional{
            inner: null,
            flag: true
        };
    }
}
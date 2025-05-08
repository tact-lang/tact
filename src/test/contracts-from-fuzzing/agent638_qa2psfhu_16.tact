struct Inner {
    val: Int as uint8;
    note: String?;
}

struct Mix {
    count: Int as uint16;
    flag: Bool?;
    nested: Inner?;
}

contract MixTest {
    data: Mix;

    init() {
        self.data = Mix{
            count: 123,
            flag: null,
            nested: Inner{ val: 42, note: "hi" }
        };
    }

    receive() {}
}
struct Mid {
    text1: String;
    text2: String;
    flag: Bool;
}

struct Outer {
    int1: Int;
    int2: Int;
    inner: Mid;
    optBool: Bool?;
    optInt: Int?;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            int1: 100,
            int2: 42,
            inner: Mid{ text1: "foo", text2: "bar", flag: false },
            optBool: null,
            optInt: 999
        };
    }
}
struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Wrapper {
    inner: Nested;
    flag: Bool;
    num: Int;
}

contract ComplexStorage {
    record: Wrapper;
    init() {
        self.record = Wrapper{
            inner: Nested{ x:10, y:null, z:"hi" },
            flag: true,
            num: 42
        };
    }
}
struct MixedTypes {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixStore {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{
            a: 5,
            b: true,
            c: null,
            d: null,
            e: "hello",
            f: null
        };
    }

    receive() {
        self.val = MixedTypes{
            a: 10,
            b: false,
            c: 1,
            d: true,
            e: "world",
            f: "test"
        };
    }
}
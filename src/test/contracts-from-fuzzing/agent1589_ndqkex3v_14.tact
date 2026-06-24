struct Compose {
    nested: SerializeTest;
    f: Int;
}

struct SerializeTest {
    a: Int as uint8;
    b: Int as int32;
    c: Bool;
    d: String;
}

contract NestedWithSerialized {
    x: Compose;

    init() {
        self.x = Compose{
            nested: SerializeTest{
                a:3, b:-3, c:false, d:"abc"
            },
            f: 77,
        };
    }
}
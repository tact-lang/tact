struct Nested {
    field1: Int;
    field2: Bool;
    nested2: Inner;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract StorageTest {
    n: Nested;

    init() {
        self.n = Nested{
            field1: 10,
            field2: false,
            nested2: Inner{
                val: 99,
                flag: true,
            },
        };
    }
}
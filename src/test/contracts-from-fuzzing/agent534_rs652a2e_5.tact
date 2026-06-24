struct Deep {
    inner: Nested;
    val: Int?;
}

struct Nested {
    flag: Bool;
    subval: Int;
}

contract DeepStructs {
    data: Deep;

    init() {
        self.data = Deep{
            inner: Nested{
                flag: false,
                subval: 123,
            },
            val: null,
        };
    }
}
struct Deep {
    inner: Bool?;
    val: Int;
}

struct Nested {
    deep: Deep;
    flag: Bool;
}

contract TestContract {
    record: Nested;

    init() {
        self.record = Nested{
            deep: Deep{ inner: true, val: 42 },
            flag: false
        };
    }
}
struct Nested {
    inner1: Int;
    inner2: Int?;
}

struct Holder {
    nested: Nested;
    flag: Bool;
}

contract TestContract {
    record: Holder;

    init() {
        self.record = Holder{
            nested: Nested{
                inner1: 7,
                inner2: null,
            },
            flag: true,
        };
    }
}
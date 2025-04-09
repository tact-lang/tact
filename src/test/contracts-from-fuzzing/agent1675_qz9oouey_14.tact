struct StrNest {
    s: String;
    n: Int;
}

struct Holder {
    first: StrNest;
    second: StrNest;
}

contract StorageMultipleStructs {
    data: Holder;
    init() {
        self.data = Holder{
            first: StrNest{ s: "hello", n: 1 },
            second: StrNest{ s: "world", n: 2 }
        };
    }
}
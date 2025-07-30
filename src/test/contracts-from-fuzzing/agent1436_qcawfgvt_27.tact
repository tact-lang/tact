// Test multiple fields with mixed optionals and serialization
struct Mix {
    a: Int as int64;
    b: Int?;
    c: Bool;
    d: String?;
    e: Slice;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            a: 10,
            b: null,
            c: true,
            d: null,
            e: emptyCell().asSlice(),
        };
    }
}

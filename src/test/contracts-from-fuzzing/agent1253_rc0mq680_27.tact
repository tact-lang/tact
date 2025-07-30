struct MultiOptionalNested {
    a: Int?;
    b: Bool?;
    c: Level1?;
}

struct Level1 {
    d: Int?;
    e: Bool?;
}

contract MultiOptNestTest {
    val: MultiOptionalNested;

    init() {
        self.val = MultiOptionalNested{
            a: null, b: null, c: null
        };
    }
}

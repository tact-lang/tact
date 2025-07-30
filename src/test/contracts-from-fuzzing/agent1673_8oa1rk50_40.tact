struct MixedNullable {
    a: Int?;
    b: Int;
    c: String?;
    d: Bool;
    e: Slice?;
}

contract MixedNullableTest {
    val: MixedNullable;

    init() {
        self.val = MixedNullable{
            a: null,
            b: 1,
            c: null,
            d: true,
            e: null,
        };
    }
}
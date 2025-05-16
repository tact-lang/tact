struct NullableDeep {
    data: String?;
}

struct TwoNullableLevel {
    inner: NullableDeep?;
    flag: Bool;
}

contract NullableTest {
    deep: TwoNullableLevel;

    init() {
        self.deep = TwoNullableLevel{
            inner: NullableDeep { data: "abc" },
            flag: false,
        };
    }
}
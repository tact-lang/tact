struct NullableBool {
    flag: Bool?;
}

struct NullableInt {
    val: Int?;
}

contract MultiTypeNullables {
    f: NullableBool;
    i: NullableInt;

    init() {
        self.f = NullableBool{ flag: null };
        self.i = NullableInt{ val: null };
    }
}
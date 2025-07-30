struct InnerNullable {
    x: Int?;
    y: Bool?;
}

struct OuterNullable {
    inner: InnerNullable?;
    flag: Bool;
}

contract NestedNullableStore {
    data: OuterNullable = OuterNullable{ inner: null, flag: true };

    init() {}

    receive() {}
}
struct NestedNullable {
    x: Int?;
    y: InnerNullable?;
}

struct InnerNullable {
    flag: Bool?;
    cnt: Int?;
}

contract TestNullableNested {
    state: NestedNullable;

    init() {
        self.state = NestedNullable{
            x: null,
            y: InnerNullable{flag: false, cnt: null}
        };
    }
}
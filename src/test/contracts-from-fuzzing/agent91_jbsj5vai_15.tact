struct NestedNullable {
    a: Int?;
    nested: InnerNullable?;
}

struct InnerNullable {
    x: Int?;
    flag: Bool?;
}

contract NestedNullableContract {
    data: NestedNullable;

    init() {
        self.data = NestedNullable{
            a: null,
            nested: InnerNullable{
                x: 1,
                flag: null
            }
        };
    }
}

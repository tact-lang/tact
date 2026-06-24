struct ComplexLevel3 {
    value: Int;
    comment: String;
}

struct ComplexLevel2 {
    flag: Bool;
    detail: ComplexLevel3;
    note: String?;
}

struct ComplexLevel1 {
    id: Int;
    info: ComplexLevel2;
}

contract NestedOptional {
    data: ComplexLevel1;

    init() {
        self.data = ComplexLevel1{
            id: 1,
            info: ComplexLevel2{
                flag: false,
                detail: ComplexLevel3{
                    value: 42,
                    comment: "deep"
                },
                note: null
            }
        };
    }
}
struct NestedStructsLevel2 {
    b1: Int;
    b2: Bool?;
}

struct NestedStructsLevel1 {
    a1: NestedStructsLevel2;
    a2: NestedStructsLevel2;
}

contract TestContract {
    data: NestedStructsLevel1;

    init() {
        self.data = NestedStructsLevel1{
            a1: NestedStructsLevel2{
                b1: 10,
                b2: null,
            },
            a2: NestedStructsLevel2{
                b1: 20,
                b2: true,
            },
        };
    }
}
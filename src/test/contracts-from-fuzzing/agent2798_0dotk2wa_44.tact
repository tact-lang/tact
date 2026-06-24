struct NestedSameType {
    a: SameType1;
}

struct SameType1 {
    b: SameType2;
}

struct SameType2 {
    c: Int;
}

contract NestedSameTypeContract {
    data: NestedSameType;

    init() {
        self.data = NestedSameType{
            a: SameType1{
                b: SameType2{
                    c: 100
                }
            }
        };
    }
}
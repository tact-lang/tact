struct NestedManyLevels1 {
    a: Int;
}

struct NestedManyLevels2 {
    inner1: NestedManyLevels1;
}

struct NestedManyLevels3 {
    inner2: NestedManyLevels2;
}

contract TestContract {
    data: NestedManyLevels3;

    init() {
        self.data = NestedManyLevels3{
            inner2: NestedManyLevels2{
                inner1: NestedManyLevels1{
                    a: 123
                }
            }
        };
    }
}
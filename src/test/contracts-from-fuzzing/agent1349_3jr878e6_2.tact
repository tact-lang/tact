struct ComplexNested {
    level1: Nested1;
    flag1: Bool;
}

struct Nested1 {
    level2: Nested2;
    flag2: Bool;
}

struct Nested2 {
    level3: Nested3;
    flag3: Bool;
}

struct Nested3 {
    value: Int;
    flag4: Bool;
}

contract DeepContract {
    data: ComplexNested = ComplexNested{
        level1: Nested1{
            level2: Nested2{
                level3: Nested3{
                    value: 10,
                    flag4: true
                },
                flag3: false
            },
            flag2: true
        },
        flag1: false
    };

    receive() {
        self.data = self.data;
    }
}
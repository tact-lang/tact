struct Deep {
    level1: Struct1;
}

struct Struct1 {
    level2: Struct2;
}

struct Struct2 {
    level3: Struct3;
}

struct Struct3 {
    x: Int;
    y: Bool?;
}

contract DeepNest {
    val: Deep;

    init() {
        self.val = Deep{
            level1: Struct1{
                level2: Struct2{
                    level3: Struct3{
                        x: 17,
                        y: true,
                    },
                },
            },
        };
    }
}
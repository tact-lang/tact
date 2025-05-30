struct Level3 {
    s: String = "foo";
    b: Bool?;
}

struct Level2 {
    inner: Level3;
    num: Int = 123;
}

struct Level1 {
    nested: Level2;
    flag: Bool = true;
}

contract TestContract {
    data: Level1 = Level1{
        nested: Level2{
            inner: Level3{
                s: "foo",
                b: null
            },
            num: 123
        },
        flag: true
    };

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{
                    s: "foo",
                    b: null
                },
                num: 123
            },
            flag: true
        };
    }
}
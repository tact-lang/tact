struct Level3 {
    a: Int;
    b: String;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    num: Int;
}

contract TestContract {
    value: Level1;

    init() {
        self.value = Level1{
            nested: Level2{
                inner: Level3{
                    a: 1,
                    b: "deep"
                },
                flag: true
            },
            num: 123
        };
    }
}
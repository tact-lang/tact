struct Level3 {
    foo: Int as uint8;
    bar: Bool?;
}

struct Level2 {
    l3: Level3;
    flag: Bool = true;
}

struct Level1 {
    l2: Level2;
    note: String?;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ foo: 42, bar: null },
                flag: false
            },
            note: null
        };
    }
}
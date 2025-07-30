struct Level3 {
    flag3: Bool;
}

struct Level2 {
    flag2: Bool?;
    l3: Level3;
}

struct Level1 {
    l2opt: Level2?;
    l2: Level2;
}

contract OptionalNested {
    complex: Level1;

    init() {
        self.complex = Level1{
            l2opt: null,
            l2: Level2{
                flag2: true,
                l3: Level3{ flag3: false }
            }
        };
    }
}
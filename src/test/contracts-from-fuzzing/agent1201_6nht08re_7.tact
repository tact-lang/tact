struct OptionalNested {
    nest1: Level1?;
}

struct Level1 {
    nest2: Level2?;
}

struct Level2 {
    nest3: Level3?;
}

struct Level3 {
    num: Int;
}

contract DeepOptionalNestTest {
    myData: OptionalNested;

    init() {
        self.myData = OptionalNested{
            nest1: null
        };
    }
}
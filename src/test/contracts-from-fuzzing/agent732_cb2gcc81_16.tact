struct Deeply {
    first: Level1;
}

struct Level1 {
    second: Level2;
}

struct Level2 {
    third: Level3;
}

struct Level3 {
    fourth: Level4;
}

struct Level4 {
    fifth: Int;
}

contract DeepNestTest {
    all: Deeply;

    init() {
        self.all = Deeply{
            first: Level1{
                second: Level2{
                    third: Level3{
                        fourth: Level4{
                            fifth: 99
                        }
                    }
                }
            }
        };
    }
}
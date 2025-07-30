struct Level3 {
    n1: Int;
    n2: String;
    n3: Slice;
}

struct Level2 {
    mid1: Bool;
    mid2: Level3;
}

struct Level1 {
    top: Level2;
}

contract MixedDeepContract {
    data: Level1;

    init() {
        self.data = Level1{
            top: Level2{
                mid1: true,
                mid2: Level3{
                    n1: 4, n2: "abcd", n3: emptyCell().asSlice()
                }
            }
        };
    }
}
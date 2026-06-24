struct Level4 {
    s: String?;          // optional primitive
}
struct Level3 {
    l4: Level4;          // required Level4
    fl: Bool = false;    // default value
}
struct Level2 {
    optL3: Level3?;      // optional Level3
    i: Int = 0;
}
struct Level1 {
    l2: Level2;          // required Level2
}

contract DeepAlternate {
    l1: Level1;

    init() {
        self.l1 = Level1{
            l2: Level2{
                optL3: null,
                i: 5
            }
        };
    }
}
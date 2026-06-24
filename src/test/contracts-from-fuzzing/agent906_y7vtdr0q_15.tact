struct Level3 {
    f: Int;
}

struct Level2 {
    o: Level3?;
}

struct Level1 {
    o2: Level2?;
}

contract NestedOpts {
    data: Level1;

    init() {
        self.data = Level1{
            o2: null
        };
    }
}
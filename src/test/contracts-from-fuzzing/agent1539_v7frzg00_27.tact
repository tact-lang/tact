struct DeeplyNested {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Level4;
}

struct Level4 {
    e: Level5;
}

struct Level5 {
    f: Int;
}

contract ManyNestedLayer {
    deep: DeeplyNested;
    init() {
        self.deep = DeeplyNested{
            a: Level1{ b: Level2{ c: Level3{ d: Level4{ e: Level5{ f: 123 } } } } }
        };
    }
}
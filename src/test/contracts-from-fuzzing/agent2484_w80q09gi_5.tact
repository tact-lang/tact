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
    e: Int;
}

contract DeepNestTest {
    store: DeeplyNested;

    init() {
        self.store = DeeplyNested{
            a: Level1{b: Level2{c: Level3{d: Level4{e: 42}}}}
        };
    }
}
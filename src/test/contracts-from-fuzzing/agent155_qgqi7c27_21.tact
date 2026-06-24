struct Deep {
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

contract DeepChain {
    data: Deep;
    init() {
        self.data = Deep{a: Level1{b: Level2{c: Level3{d: Level4{e: 123}}}}};
    }
}
struct Level3 {
    foo: Int = 3;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract ChainNested {
    val: Level1 = Level1{nested2: Level2{nested3: Level3{foo: 5}}};

    receive() {
        self.val = Level1{nested2: Level2{nested3: Level3{foo: 42}}};
    }
}
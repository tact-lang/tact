struct Level3 {
    c: Int;
}

struct Level2 {
    b: Int;
    l3: Level3;
}

struct Level1 {
    a: Int;
    l2: Level2;
}

contract TestNestedStruct {
    receive() {
        let instance: Level1 = Level1 { a: 1, l2: Level2 { b: 2, l3: Level3 { c: 3 } } };
    }
}

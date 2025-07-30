struct Level3 {
    d: Int;
}

struct Level2 {
    c: Int;
    l3: Level3;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract SerialOrderNestedTest {
    value: Level1;

    init() {
        self.value = Level1{
            a: 10,
            b: Level2{
                c: 20,
                l3: Level3{ d: 30 }
            }
        };
    }
}

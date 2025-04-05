struct Level1 {
    v: Int;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

struct Level5 {
    l4: Level4;
}

contract TestContract {
    receive() {
        let a = Level5{ l4: Level4{ l3: Level3{ l2: Level2{ l1: Level1{ v: 42 } } } } };
        a.l4.l3.l2.l1.v;
    }
}

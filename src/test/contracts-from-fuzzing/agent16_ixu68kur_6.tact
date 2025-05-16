struct Level5 {
    a: Int
}

struct Level4 {
    a: Int;
    next: Level5
}

struct Level3 {
    a: Int;
    next: Level4
}

struct Level2 {
    a: Int;
    next: Level3
}

struct Level1 {
    a: Int;
    next: Level2
}

fun sumChain(l: Level1): Int {
    return l.a + l.next.a + l.next.next.a + l.next.next.next.a + l.next.next.next.next.a;
}

contract TestDeepChain {
    receive() {
        let l5: Level5 = Level5{ a: 5 };
        let l4: Level4 = Level4{ a: 4, next: l5 };
        let l3: Level3 = Level3{ a: 3, next: l4 };
        let l2: Level2 = Level2{ a: 2, next: l3 };
        let l1: Level1 = Level1{ a: 1, next: l2 };
        sumChain(l1);
    }
}

struct Level5 {
    val: Int;
}

struct Level4 {
    val: Int;
    next: Level5?;
}

struct Level3 {
    val: Int;
    next: Level4?;
}

struct Level2 {
    val: Int;
    next: Level3?;
}

struct Level1 {
    val: Int;
    next: Level2?;
}

contract TestContract {
    receive() {
        let l5: Level5 = Level5 { val: 50 };
        let l4: Level4 = Level4 { val: 40, next: l5 };
        let l3: Level3 = Level3 { val: 30, next: l4 };
        let l2: Level2 = Level2 { val: 20, next: l3 };
        let l1: Level1 = Level1 { val: 10, next: l2 };
        dump(l1.next!! .next!! .next!! .val);
    }
}

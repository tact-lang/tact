struct Level10 {
    val: Int;
}

struct Level9 {
    val: Int;
    next: Level10?;
}

struct Level8 {
    val: Int;
    next: Level9?;
}

struct Level7 {
    val: Int;
    next: Level8?;
}

struct Level6 {
    val: Int;
    next: Level7?;
}

struct Level5 {
    val: Int;
    next: Level6?;
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
        let l10: Level10 = Level10 { val: 10 };
        let l9: Level9 = Level9 { val: 9, next: l10 };
        let l8: Level8 = Level8 { val: 8, next: l9 };
        let l7: Level7 = Level7 { val: 7, next: l8 };
        let l6: Level6 = Level6 { val: 6, next: l7 };
        let l5: Level5 = Level5 { val: 5, next: l6 };
        let l4: Level4 = Level4 { val: 4, next: l5 };
        let l3: Level3 = Level3 { val: 3, next: l4 };
        let l2: Level2 = Level2 { val: 2, next: l3 };
        let l1: Level1 = Level1 { val: 1, next: l2 };
        // Accessing a nested field inside the deep chain
        dump(l1.next!! .next!! .next!! .val);
        // Here l1.next is Level2, l1.next!!.next is Level3, l1.next!!.next!!.next is Level4: we dump its val, expected output is 4
    }
}

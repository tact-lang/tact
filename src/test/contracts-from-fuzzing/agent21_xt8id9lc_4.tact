struct Level7 {
    val: Int;
}

struct Level6 {
    next: Level7;
}

struct Level5 {
    next: Level6;
}

struct Level4 {
    next: Level5;
}

struct Level3 {
    next: Level4;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract TestDeepNested {
    receive() {
        let s: Level1 = Level1{
            next: Level2{
                next: Level3{
                    next: Level4{
                        next: Level5{
                            next: Level6{
                                next: Level7{ val: 123 }
                            }
                        }
                    }
                }
            }
        };
        let result: Int = s.next.next.next.next.next.next.val;
        // result should be 123
    }
}

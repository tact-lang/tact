struct Level5 {
    val: Int;
}

struct Level4 {
    l5: Level5;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

fun get_val(l: Level1): Int {
    return l.l2.l3.l4.l5.val;
}

contract TestContract {
    receive() {
        let l: Level1 = Level1 {
            l2: Level2 {
                l3: Level3 {
                    l4: Level4 {
                        l5: Level5 { val: 42 }
                    }
                }
            }
        };
        let r = get_val(l);
    }
}

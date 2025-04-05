struct Level5 {
    v: Int;
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

fun makeDeep() : Level1 {
    return Level1{
        l2: Level2{
            l3: Level3{
                l4: Level4{
                    l5: Level5{
                        v: 42
                    }
                }
            }
        }
    };
}

contract Test {
    receive() {
         let d = makeDeep();
         let value = d.l2.l3.l4.l5.v;
    }
}

struct Level5 {
    val: Int
}

struct Level4 {
    l5: Level5;
    a: Int
}

struct Level3 {
    l4: Level4;
    a: Int
}

struct Level2 {
    l3: Level3;
    a: Int
}

struct Level1 {
    l2: Level2;
    a: Int
}

contract TestDeepChain {
    receive() {
        // Deep chain of nested structs
        let chain = Level1{
            a: 10,
            l2: Level2{
                a: 20,
                l3: Level3{
                    a: 30,
                    l4: Level4{
                        a: 40,
                        l5: Level5{ val: 50 }
                    }
                }
            }
        };
        // Sum values from all levels: 10 + 20 + 30 + 40 + 50 = 150
        chain.a + chain.l2.a + chain.l2.l3.a + chain.l2.l3.l4.a + chain.l2.l3.l4.l5.val;
    }
}

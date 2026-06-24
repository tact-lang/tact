struct L4 {
    a: Int;
}

struct L3 {
    l4: L4?;
}

struct L2 {
    l3: L3;
}

struct L1 {
    l2: L2;
    m: map<Int, Int>;
}

contract TestDeepOptionalMap2 {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let s: L1 = L1{
            l2: L2{
                l3: L3{
                    l4: null
                }
            },
            m: m
        };
    }
}

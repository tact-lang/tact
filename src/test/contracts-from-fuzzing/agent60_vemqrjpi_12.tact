struct L1 {
    m: map<Int, Int>
}

struct L2 {
    l1: L1?
}

struct L3 {
    l2: L2?
}

struct L4 {
    l3: L3?
}

contract TestDeepNestedOptionalMap {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        
        let instance = L4 {
            l3: L3 {
                l2: L2 {
                    l1: L1 { m: m }
                }
            }
        };
        
        let val = instance.l3!!.l2!!.l1!!.m.get(1)!!;
        dump(val);
    }
}

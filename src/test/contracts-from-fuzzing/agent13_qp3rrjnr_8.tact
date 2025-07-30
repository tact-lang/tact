struct L1 {
    f: Int;
}

struct L2 {
    l1: L1;
}

struct L3 {
    l2: L2;
}

struct L4 {
    l3: L3;
}

contract DeepStruct {
    receive() {
        let inner: L1 = L1{ f: 42 };
        let mid: L2 = L2{ l1: inner };
        let outer: L3 = L3{ l2: mid };
        let s: L4 = L4{ l3: outer };
    }
}

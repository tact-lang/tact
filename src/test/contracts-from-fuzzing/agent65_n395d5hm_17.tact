struct L4 {
    v: Int;
}

struct L3 {
    inner: L4;
}

struct L2 {
    inner: L3;
}

struct L1 {
    inner: L2;
}

contract TestDeepGetter {
    receive() {}

    // Getter returning a deeply nested structure
    get fun deepGetter(): L1 {
        return L1{
            inner: L2{
                inner: L3{
                    inner: L4{ v: 123 }
                }
            }
        };
    }
}

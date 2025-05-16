struct L5 {
    v: Int;
}

struct L4 {
    v: Int;
    next: L5;
}

struct L3 {
    v: Int;
    next: L4;
}

struct L2 {
    v: Int;
    next: L3;
}

struct L1 {
    v: Int;
    next: L2;
}

contract TestContract {
    receive() {
        // Instantiate deeply nested structure
        let deep = L1{
            v: 1,
            next: L2{
                v: 2,
                next: L3{
                    v: 3,
                    next: L4{
                        v: 4,
                        next: L5{
                            v: 5
                        }
                    }
                }
            }
        };
        // Access a deeply nested field
        let extracted = deep.next.next.next.v; // should be 4
    }
}

struct L1 {
    a: Int;
    b: Int;
}

struct L2 {
    left: L1;
    right: L1;
}

struct L3 {
    x: L2;
    y: L2;
    z: L2;
}

contract TestComplexNested {
    init() {
        let inst = L3 {
            x: L2 {
                left: L1 { a: 1, b: 2 },
                right: L1 { a: 3, b: 4 }
            },
            y: L2 {
                left: L1 { a: 5, b: 6 },
                right: L1 { a: 7, b: 8 }
            },
            z: L2 {
                left: L1 { a: 9, b: 10 },
                right: L1 { a: 11, b: 12 }
            }
        };
    }
}

struct L5 {
    x: Int;
}

struct L4 {
    x: Int;
    next: L5;
}

struct L3 {
    x: Int;
    next: L4;
}

struct L2 {
    x: Int;
    next: L3;
}

struct L1 {
    x: Int;
    next: L2;
}

contract TestDeepNested {
    receive() {
        let obj: L1 = L1 { 
            x: 1,
            next: L2 { 
                x: 2,
                next: L3 { 
                    x: 3,
                    next: L4 { 
                        x: 4,
                        next: L5 { x: 5 }
                    }
                }
            }
        };
        let sum = obj.x + obj.next.x + obj.next.next.x + obj.next.next.next.x + obj.next.next.next.next.x;
        sum;
    }
}

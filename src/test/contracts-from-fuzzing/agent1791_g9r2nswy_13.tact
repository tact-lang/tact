struct L1 {
    a: Int;
    optNext: L2?;
}

struct L2 {
    b: Int;
    optNext: L3?;
}

struct L3 {
    c: Int;
    optNext: L4?;
}

struct L4 {
    d: Int;
    optNext: L5?;
}

struct L5 {
    e: Int;
}

contract Test14 {
    top: L1 = L1{
        a: 1,
        optNext: L2{
            b: 2,
            optNext: L3{
                c: 3,
                optNext: L4{
                    d: 4,
                    optNext: L5{ e: 5 }
                }
            }
        }
    };
    init() {}
}

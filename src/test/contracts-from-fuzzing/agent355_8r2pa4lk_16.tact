struct Sub {
    x: Int;
}

struct Wrapper {
    a: Sub;
    b: Sub;
    c: Sub;
}

contract ReusedStructs {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            a: Sub{ x: 5 },
            b: Sub{ x: 10 },
            c: Sub{ x: 15 }
        };
    }
}
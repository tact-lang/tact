struct Sub {
    x: Int;
}
struct Root {
    s1: Sub;
    s2: Sub;
    s3: Sub;
    s4: Sub;
    s5: Sub;
}

contract TestContract {
    data: Root;
    init() {
        self.data = Root{
            s1: Sub{ x: 1 },
            s2: Sub{ x: 2 },
            s3: Sub{ x: 3 },
            s4: Sub{ x: 4 },
            s5: Sub{ x: 5 }
        };
    }
    receive() {
        self.data.s3.x = 99;
    }
}
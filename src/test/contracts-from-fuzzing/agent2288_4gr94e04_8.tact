struct Sub {
    a: Int;
    b: Int;
    c: Int;
}

struct Wrapper {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

contract ManyStructs {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            s1: Sub{ a:1, b:2, c:3 },
            s2: Sub{ a:4, b:5, c:6 },
            s3: Sub{ a:7, b:8, c:9 },
        };
    }
}
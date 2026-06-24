struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    s1a: S1;
    s1b: S1;
    flag: Bool;
}

contract TestContract {
    data: S2;

    init() {
        self.data = S2{
            s1a: S1{ a:1, b:null },
            s1b: S1{ a:2, b: 3 },
            flag: true
        };
    }
}
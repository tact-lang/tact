struct A { 
    b: B; 
    c: C; 
}

struct B {
    i: Int;
    s: String?;
}

struct C {
    flag: Bool;
    info: Info;
}

struct Info {
    number: Int?;
    text: String?;
}

contract MultiLevelDeep {
    data: A;

    init() {
        self.data = A{
            b: B{ i: 12, s: null },
            c: C{ flag: true, info: Info{ number: null, text: null } }
        };
    }
}
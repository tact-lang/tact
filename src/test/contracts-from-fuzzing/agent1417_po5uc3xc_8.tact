struct StrA {
    a: Int;
    b: String;
}

struct StrB {
    a: Int;
    nest: StrA;
    c: String;
}

contract DefaultsVsInit {
    data: StrB;
    init() {
        self.data = StrB{
            a: 5,
            nest: StrA{
                a: 10,
                b: "X"
            },
            c: "Y"
        };
    }
}
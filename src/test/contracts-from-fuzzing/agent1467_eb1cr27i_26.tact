struct C1 {
    i: Int;
    s: String;
}

struct C2 {
    c: C1;
    b: Bool;
}

struct C3 {
    c2: C2;
    str: String?;
}

contract NestedThree {
    val: C3;
    init() {
        self.val = C3{
            c2: C2{
                c: C1{
                    i: 99,
                    s: "nested"
                },
                b: true
            },
            str: null
        };
    }
}
struct OuterMost {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    a: Bool;
    b: Int?;
}

struct Inner2 {
    s: Inner3;
}

struct Inner3 {
    sss: String?;
}

contract DeepStructs {
    d: OuterMost;

    init() {
        self.d = OuterMost{
            s1: Inner1{
                a: true,
                b: null
            },
            s2: Inner2{
                s: Inner3{
                    sss: null
                }
            }
        };
    }
}
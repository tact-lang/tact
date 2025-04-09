struct DeepTree {
    i: Inner1;
}

struct Inner1 {
    j: Inner2;
    v: Int;
}

struct Inner2 {
    k: Inner3;
    w: Bool;
}

struct Inner3 {
    s: String;
    u: Int?;
}

contract Test50 {
    d: DeepTree;

    init() {
        self.d = DeepTree{
            i: Inner1{
                j: Inner2{
                    k: Inner3{
                        s: "deep",
                        u: null
                    },
                    w: true
                },
                v: 22
            }
        };
    }
}
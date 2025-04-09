struct Compose {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: String;
    e: InnerMost;
}

struct InnerMost {
    f: Int;
    g: Bool;
}

contract DeepStorage {
    val: Compose;

    init() {
        self.val = Compose{
            a: 5,
            b: Inner{
                c: 10,
                d: "abc",
                e: InnerMost{ f:42, g:false }
            }
        };
    }
}
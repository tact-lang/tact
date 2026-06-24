struct S {
    a: Int?;
    b: Int? = 17;
    c: String?;
    d: String? = "hi";
    e: Bool?;
    f: Bool? = true;
}

struct Wrapper {
    inner: S;
    flag: Bool = false;
}

contract ComboDefaults {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: S{
                a: null,
                // b is defaulted
                c: "manually set",
                // d is defaulted
                e: null,
                // f is defaulted
            },
            flag: true
        };
    }

    receive() {}
}
struct Mix {
    i: Int;
    b: Bool?;
    s: String;
    addr: Address?;
    nested: Inner;
}

struct Inner {
    flag: Bool;
    number: Int?;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            i: 7,
            b: null,
            s: "mix",
            addr: null,
            nested: Inner{
                flag: true,
                number: 999,
            }
        };
    }
}
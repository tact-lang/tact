// test optionals and defaulted fields in nested structs
struct DefOptInner {
    score: Int = 0;
    flag: Bool?;
}

struct DefOptOuter {
    inner: DefOptInner?;
    name: String = "abc";
}

contract DefaultOptionals {
    data: DefOptOuter;

    init() {
        self.data = DefOptOuter{
            inner: DefOptInner{
                score: 42,
                flag: null
            },
            name: "zzz"
        };
    }
}

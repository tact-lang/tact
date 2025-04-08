struct BigNested {
    u: Unit;
    inner: InnerNested;
}

struct InnerNested {
    first: Int;
    second: InnerMostNested;
}

struct InnerMostNested {
    s: String;
    opt: Bool?;
    flag: Bool;
}

struct Unit {
    id: Int;
    name: String;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            u: Unit{ id:1, name:"Alice" },
            inner: InnerNested{
                first: 2,
                second: InnerMostNested{
                    s: "deep",
                    opt: null,
                    flag: true
                }
            }
        };
    }
}
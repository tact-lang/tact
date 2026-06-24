struct InnerMost {
    a: Int;
    b: String?;
}

struct Mid {
    c: InnerMost?;
}

struct Outer {
    flag: Bool;
    d: Mid?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            flag: true,
            d: Mid{
                c: InnerMost{
                    a: 777,
                    b: "hello"
                }
            }
        };
    }
}
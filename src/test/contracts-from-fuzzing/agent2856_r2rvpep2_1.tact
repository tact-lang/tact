struct InnerNested {
    flag: Bool;
    text: String;
}

struct Outer {
    value: Int;
    optInner: InnerNested?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            value: 15,
            optInner: InnerNested{
                flag: true,
                text: "test"
            }
        };
    }
}

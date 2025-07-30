struct OptionalContainer {
    inner: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptContainer {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            inner: InnerOpt{
                a: 777,
                b: true,
                c: myAddress(),
                d: emptyCell(),
                e: "yay"
            }
        };
    }
}
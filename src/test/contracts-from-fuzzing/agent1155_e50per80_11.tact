struct OptionalInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

struct Container {
    inner: OptionalInStruct;
    e: String;
    f: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: OptionalInStruct{
                a: null,
                b: true,
                c: "text",
                d: emptyCell()
            },
            e: "container",
            f: false
        };
    }
}

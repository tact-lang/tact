struct NestedDeep {
    i: Int;
    flag: Bool;
    txt: String;
}

struct Container {
    info: NestedDeep;
    status: Bool;
    count: Int;
    data: Cell;
}

contract DeepTest {
    field: Container;

    init() {
        self.field = Container{
            info: NestedDeep{
                i: 42,
                flag: true,
                txt: "deep",
            },
            status: false,
            count: 7,
            data: emptyCell(),
        };
    }
}

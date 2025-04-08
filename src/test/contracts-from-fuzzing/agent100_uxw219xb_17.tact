struct SFlag {
    ok: Bool;
}

struct Container {
    item: SFlag;
    text: String;
}

contract NestedContainer {
    c: Container;

    init() {
        self.c = Container{
            item: SFlag{ ok: true },
            text: "done"
        };
    }
}
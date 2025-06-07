struct Data {
    head: Int;
    tail: Cell as remaining;
}

struct Container {
    item: Data;
    tag: String;
}

contract TestContract {
    persisted: Container;

    init() {
        self.persisted = Container{
            item: Data{
                head: 99,
                tail: emptyCell()
            },
            tag: "foo"
        };
    }
}
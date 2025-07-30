struct Container {
    a: Int;
    payload: Payload;
}

struct Payload {
    raw: Cell as remaining;
}

contract ContainsRemaining {
    state: Container;
    init() {
        self.state = Container{
            a: 42,
            payload: Payload{ raw: emptyCell() }
        };
    }
}
struct Data {
    num: Int as uint32;
    flag: Bool;
}

struct Container {
    payload: Data?;
}

contract OptionalSerialized {
    cont: Container;

    init() {
        self.cont = Container{ payload: null };
    }
}

message(40404) Data {
    x: Int;
    payload: Cell as remaining;
}

struct Container {
    maybe: Data?;
    note: String;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            maybe: null,
            note: "hello",
        };
    }
}
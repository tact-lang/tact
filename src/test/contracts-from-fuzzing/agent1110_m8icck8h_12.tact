struct Inner {
    val: Int as uint16;
}

struct Container {
    payload: Inner?;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            payload: null,
            flag: false,
        };
    }
}
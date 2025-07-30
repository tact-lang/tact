// test with nested optional fields inside nested structs
struct Inner {
    x: Int?;
    y: Bool?;
}

struct Container {
    data: Inner?;
}

contract TestContract {
    storage: Container;
    init() {
        self.storage = Container{
            data: null,
        };
    }
}
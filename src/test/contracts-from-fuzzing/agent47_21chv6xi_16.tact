struct Inner {
    val: Int?;
}

struct Container {
    content: Inner?;
}

contract NestedNullables {
    storage: Container;

    init() {
        self.storage = Container{
            content: null
        };
    }
}
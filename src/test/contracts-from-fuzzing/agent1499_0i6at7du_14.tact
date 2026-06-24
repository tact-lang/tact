struct Element {
    val: Int;
}

struct ArrayLike {
    e0: Element?;
    e1: Element?;
    e2: Element?;
}

contract ArrayOptStructs {
    storage: ArrayLike;
    init() {
        self.storage = ArrayLike{
            e0: null,
            e1: Element{val: 1},
            e2: null
        };
    }
    receive() {}
}
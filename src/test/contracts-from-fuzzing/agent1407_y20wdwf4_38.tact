struct Content {
    text: Slice as remaining;
}

struct Container {
    content: Content;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            content: Content{ text: emptyCell().asSlice() }
        };
    }
}
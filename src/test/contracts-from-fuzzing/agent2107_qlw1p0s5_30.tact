struct Container {
    inside: String?;
}

contract StringOptionals {
    val: Container;

    init() {
        self.val = Container {
            inside: null
        };
    }
}
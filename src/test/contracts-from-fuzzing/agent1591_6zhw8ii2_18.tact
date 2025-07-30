struct Compose {
    i: Int;
    s: String;
}

contract ComposeOptional {
    data: Compose?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = self.data;
    }
}
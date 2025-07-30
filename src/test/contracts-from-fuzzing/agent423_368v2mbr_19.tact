struct Sub {
    flag: Bool;
}

struct Container {
    s: Sub;
}

contract OptionalContainer {
    container: Container?;
    init() {
        self.container = null;
    }
}
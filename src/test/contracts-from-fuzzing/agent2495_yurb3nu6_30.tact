struct Container {
    a: Int;
}

contract OptContainerTest {
    c: Container?;

    init() {
        self.c = null;
    }
}
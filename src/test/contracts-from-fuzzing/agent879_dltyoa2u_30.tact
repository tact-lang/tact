struct Container {
    s: String;
}
contract OptionalContainerTest {
    data: Container?;
    init() {
        self.data = null;
    }
}

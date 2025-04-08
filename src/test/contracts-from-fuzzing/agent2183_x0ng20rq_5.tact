contract InitDefaultTest {
    foo: Int = 1;
    bar: Bool;
    name: String = "default";

    init() {
        self.bar = true;
    }
}
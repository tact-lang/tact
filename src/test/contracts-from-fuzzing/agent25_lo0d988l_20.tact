// Using a String? with explicit null default for a field
contract TestContract {
    s: String? = null;
    num: Int = 7;

    init() {
        self.s = "test";
        self.num = 42;
    }
}
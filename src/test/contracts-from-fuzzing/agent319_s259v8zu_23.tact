// Optional overriding default
contract TestContract {
    x: Int? = null;
    y: Int? = 5;

    init() {
        self.x = 42;
        self.y = null;
    }
}
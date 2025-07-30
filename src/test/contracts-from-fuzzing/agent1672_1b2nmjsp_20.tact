// Int field without initialization should require init() to set it
contract TestContract {
    x: Int;
    y: Bool;
    init() {
        self.x = 42;
        self.y = true;
    }
}
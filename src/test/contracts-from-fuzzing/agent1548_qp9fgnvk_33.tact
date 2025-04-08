const GLOBAL: Int = 1000;

contract Test {
    x: Int = GLOBAL;

    init() {
        self.x = 1;
    }
}
// contract default value ordering + override
contract TestContract {
    x: Int = 1;
    y: Int = 2;

    init() {
        self.x = 10;
        self.y = 20;
    }
}
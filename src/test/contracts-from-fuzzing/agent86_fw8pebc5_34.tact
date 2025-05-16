// test contract field with default but reassigned in init
contract C {
    x: Int = 3;

    init() {
        self.x = 5;
    }
}
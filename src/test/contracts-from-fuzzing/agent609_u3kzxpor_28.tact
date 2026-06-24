trait Base { x: Int; }

contract OverrideInContract with Base {
    x: Int;

    init() {
        self.x = 42;
    }
}
struct OptSub {
    x: Int?;
}

contract C {
    x: OptSub?;

    init() {
        self.x = null;
    }
}
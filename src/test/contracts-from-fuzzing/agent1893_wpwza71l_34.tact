struct Simple {
    a: Int;
}

contract TopLevelNull {
    x: Simple?;

    init() {
        self.x = null;
    }
}
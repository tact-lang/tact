struct Contained {
    field: Int;
}

contract OptContainer {
    optF: Contained?;
    init() {
        self.optF = null;
    }
}
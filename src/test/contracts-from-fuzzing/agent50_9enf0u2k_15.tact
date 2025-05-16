contract DefaultGetterCorrect {
    x: Int;

    init() {
        self.x = 0;
    }

    receive() {}

    // Getter that returns the persistent state variable x, expected to return default value 0
    get fun getX(): Int {
        return self.x;
    }
}

contract GetterTest {
    state: Int = 0;

    init() {
        self.state = 0;
    }

    // Getter function which attempts to modify contract state
    get fun getAndModify() : Int {
        self.state = self.state + 1;
        return self.state;
    }
}

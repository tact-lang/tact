contract TestContract {
    state1: Int?;
    state2: Bool = false;
    state3: Address?;
    state4: Cell;
    state5: String = "";

    init() {
        self.state1 = null;
        self.state2 = true;
        self.state3 = null;
        self.state4 = emptyCell();
        self.state5 = "hello";
    }
}

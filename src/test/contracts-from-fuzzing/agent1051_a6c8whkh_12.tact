contract TestContract {
    one: Int = 7;
    two: Bool = true;
    three: String = "X";
    four: Int? = null;
    five: Address;
    init() {
        self.five = myAddress();
    }
}
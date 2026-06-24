const TON01: Int = ton("0.1");

contract TestTon() {
    // Getter to return the evaluated constant value for ton("0.1")
    get fun get_ton() : Int {
         return TON01;
    }
}

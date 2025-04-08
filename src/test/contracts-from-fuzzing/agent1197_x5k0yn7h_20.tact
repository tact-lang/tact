// same as before but no default value for address or cell since myAddress()/emptyCell() forbidden as initializers
contract TestContract {
    val1: Int = 1;
    val2: Int as uint8 = 255;
    val3: Int as int16 = -1000;
    val4: Bool = true;
    val5: Bool? = false;
    val6: String = "Hello";
    val7: Address;
    val8: Cell;
    init() {
        self.val7 = myAddress();
        self.val8 = emptyCell();
    }
}
contract GetterReturnTest {
    // Field now has a default initialization
    v: Int = 0;

    // Empty receive function
    receive() {}

    // Getter function with conditional return
    get fun getVal(): Int {
        if (self.v > 0) {
            return self.v;
        } else {
            return 0;
        }
    }

    // main function to update state and dump getter result
    fun main() {
        self.v = -5;  // assign a negative value
        dump(self.getVal()); // expecting 0
        self.v = 10;
        dump(self.getVal()); // expecting 10
    }
}

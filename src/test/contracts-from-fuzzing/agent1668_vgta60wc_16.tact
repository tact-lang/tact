// Contract with empty init and mixed fields with defaults
contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: String = "str";
    e: Slice;

    init() {
        self.c = myAddress();
        self.e = emptyCell().asSlice();
    }
}

const FLAG: Bool = true;

contract TestBoolConstant {
    receive() {
        let _flag: Bool = FLAG;
        // Using the constant in a trivial if to force evaluation
        if (_flag) {
            // do nothing
        }
    }
}

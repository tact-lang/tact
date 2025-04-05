const FLAG: Bool = true;

contract TestContract {
    receive() {
        if (FLAG) {
            let x: Int = 1;
        } else {
            let x: Int = 0;
        }
    }
}

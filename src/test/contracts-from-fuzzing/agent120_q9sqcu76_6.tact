contract B(val: Int) {}

contract TestB {
    receive() {
        let s = initOf B(42);
        let c = codeOf B;
    }
}

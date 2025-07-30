const COMPLICATED: Int = (2 + 3) * 4 - 5;

contract TestComplicated {
    receive() {
        let res: Int = COMPLICATED;
    }
}

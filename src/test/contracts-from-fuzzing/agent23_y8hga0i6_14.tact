const COMPOUND: Int = (10 * 2) + (8 / 2) - 3;

contract TestCompound {
    receive() {
        let result: Int = COMPOUND;
    }
}

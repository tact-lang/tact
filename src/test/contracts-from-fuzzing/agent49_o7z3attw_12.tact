const COMBO: Int = ton("1") + ton("1");

contract Test {
    receive() {
        let x = COMBO;
    }
}

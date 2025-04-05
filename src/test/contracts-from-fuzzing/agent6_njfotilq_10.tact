const IS_ENABLED: Bool = true;

contract Test1 {
    receive() {
        if (IS_ENABLED) {
            1;
        } else {
            0;
        }
    }
}

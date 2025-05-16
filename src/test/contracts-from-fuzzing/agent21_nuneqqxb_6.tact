fun takeAnInt(n: Int) {
}

contract Test5 {
    receive() {
        takeAnInt(999999999999999999999999999999);
    }
}

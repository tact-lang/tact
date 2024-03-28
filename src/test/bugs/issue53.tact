contract Issue53 {
    init() {}
    receive() {
        require(1 == 2, "condition can`t be...");
    }
}
contract TestOptional() {
    receive() {
        let opt: Int? = 42;
        let x = opt!!;
        require(x == 42, "Test Failed");
        dump(x);
        cashback(sender());
    }
}

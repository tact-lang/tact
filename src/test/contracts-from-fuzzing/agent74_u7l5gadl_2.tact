fun test_optional_valid() {
    let opt: Int? = null;
    opt = 255;
    dump(opt!!);
}

contract TestOpt {
    receive() {
        test_optional_valid();
        cashback(sender());
    }
}

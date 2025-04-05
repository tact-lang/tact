fun testReturn(): Int {
    return 42;
}

contract TestReturnContract {
    receive() {
        let res: Int = testReturn();
        dump(res);
    }
}

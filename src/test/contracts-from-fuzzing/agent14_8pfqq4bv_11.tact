fun test_try2(): Int {
    try {
        if (false) { throw(101); }
    } catch (err) {
        return err;
    }
    return 0;
}

contract TestTry2 {
    receive() {
        dump(test_try2());
    }
}

fun test(_: Int, _: Int): Bool {
    return true;
}

contract TestGlobal {
    receive(msg: Slice) {
        // Call the function to ensure it's compiled
        test(1, 2);
    }
}

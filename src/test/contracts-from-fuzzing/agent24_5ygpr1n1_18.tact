extends fun sum(self: Int, _: Int): Int {
    // The second parameter is discarded
    return self;
}

contract Test {
    receive() {
        // Call extension function via method syntax
        let res = 10.sum(20);
        dump(res); // Expected output: 10
    }
}

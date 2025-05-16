contract Test {
    receive() {
        // Testing String.hashData: should produce an Int hash of a valid string with bits divisible by 8 (e.g., 4 ASCII chars: 'Data')
        dump("Data".hashData());
    }
}

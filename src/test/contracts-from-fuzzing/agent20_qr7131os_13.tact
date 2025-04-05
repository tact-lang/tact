contract TestBitwiseOr {
    receive() {
        let result: Int = 255 | 0b00001111;
        dump(result); // expecting 255
    }
}

contract TestContract {
    receive() {
        let bigStr = "123456789 123456789 123456789 123"; // 33 bytes
        dump(bigStr);
    }
}
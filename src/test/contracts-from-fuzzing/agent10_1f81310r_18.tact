fun decodeBase64(myStr: String): Slice {
    return myStr.fromBase64();
}

contract TestContract {
    receive() {
        let x = decodeBase64("SGVsbG8gV29ybGQ=");
    }
}

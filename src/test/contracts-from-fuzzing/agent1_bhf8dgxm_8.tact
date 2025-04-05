fun identityOpt(x: Int?): Int? {
    return x;
}

contract Test {
    receive() {
        identityOpt(null);
    }
}
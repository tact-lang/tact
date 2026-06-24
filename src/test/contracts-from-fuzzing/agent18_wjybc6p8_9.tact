contract CP(x: Int, y: Int) {
    receive() {}
}

contract TestCP {
    receive() {
        let cp_init = initOf CP(3, 4);
        let cp_code = codeOf CP;
    }
}

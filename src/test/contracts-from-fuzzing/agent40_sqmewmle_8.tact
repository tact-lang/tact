contract TernaryValid {
    receive() {
        let x: Int = false ? 1 : (false ? 2 : 3);
        dump(x);
    }
}

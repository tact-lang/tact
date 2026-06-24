contract TestRequire2 {
    init() {
        // Correct use of require: second argument is a string literal
        require(1 + 1 == 2, "Math error: 1+1 != 2");
    }

    get fun getValue(): Int {
        return 42;
    }
}

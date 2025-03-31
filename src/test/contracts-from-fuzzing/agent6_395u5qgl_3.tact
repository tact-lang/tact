contract A {
    receive() {}

    get fun test_init_vs_code(): Bool {
        let init_pkg = initOf A();
        return codeOf A == init_pkg.code;
    }
}

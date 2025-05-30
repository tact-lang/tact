contract TestTernary {
    value: Int;

    init() {
        self.value = 0;
    }

    receive() {
        let x: Int = true ? 10 : 20;
        dump(x); // expected output: 10
    }
}

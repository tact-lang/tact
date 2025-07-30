contract TestTernary {
    receive() {
        let cond: Bool = (2 + 2 == 4);
        let out: String = cond ? "True" : "False";
        dump(out); // expected output: "True"
    }
}

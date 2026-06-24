contract TestTernary {
    receive() {
        let a: Int = 100;
        let res: String = (a > 50 ? "yes" : "no");
        dump(res);
    }
}

contract TestIf {
    receive() {
        let cond: Bool = true;
        if (cond) {
            dump(1);
        }
        dump(2);
    }
}

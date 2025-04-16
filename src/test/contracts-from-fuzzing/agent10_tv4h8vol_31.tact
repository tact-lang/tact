contract TestTernary {
    receive() {
        let b: Bool = (2 + 2 == 4) ? true : false;
        dump(b);
    }
}

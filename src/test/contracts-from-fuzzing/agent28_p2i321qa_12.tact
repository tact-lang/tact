contract TestTernary {
    receive() {
        let res: Bool = (2 + 2 == 4) ? true : false;
        dump(res);
    }
}

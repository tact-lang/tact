contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        let rep1: Bool = m.replace(7, 68); // should return true
        let rep2: Bool = m.replace(8, 68); // should return false, key not present
        dump(rep1);
        dump(rep2);
    }
}

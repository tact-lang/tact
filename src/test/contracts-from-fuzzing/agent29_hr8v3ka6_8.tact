contract TestReplace {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        let replaced: Bool = m.replace(7, 68);
        dump(replaced); // expected: true
        let v: Int = m.get(7)!!;
        dump(v); // expected: 68
        replaced = m.replace(8, 100);
        dump(replaced); // expected: false
    }
}

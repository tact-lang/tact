contract TestReplaceNull {
    get fun test() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(100, 200);
        let r = m.replace(100, null);
        if (r == true && m.get(100) == null) {
            return 1;
        } else {
            return 0;
        }
    }
}

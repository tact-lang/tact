contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        let oldVal: Int? = m.replaceGet(7, null); // should delete the key and return 70
        let curVal: Int? = m.get(7); // should be null
        
        if (oldVal != null && curVal == null) {
            dump(1);
        } else {
            dump(0);
        }
    }
}

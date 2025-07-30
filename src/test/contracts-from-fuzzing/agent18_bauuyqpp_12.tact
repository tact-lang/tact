contract TestMapEquality {
    fun showcase() {
        let m: map<Int, Int> = emptyMap();
        dump(m == emptyMap()); // expected output: true
    }
}

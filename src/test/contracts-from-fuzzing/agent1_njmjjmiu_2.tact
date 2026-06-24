contract MapBasic {
    receive() {
        // Testing basic map creation, .set() and .get()
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let a: Int = m.get(1)!!;
        dump(a);
    }
}

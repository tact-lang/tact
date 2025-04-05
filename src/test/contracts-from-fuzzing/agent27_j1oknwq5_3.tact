contract TestMaps() {
    fun main() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let old: Int? = m.replaceGet(1, 200);
        dump(old!!);          // expected output: 100
        dump(m.get(1)!!);       // expected output: 200
        dump(m.del(1));         // expected output: true
        dump(m.exists(1));      // expected output: false
    }
    
    // Minimal receiver to satisfy contract requirements
    receive() { return; }
}

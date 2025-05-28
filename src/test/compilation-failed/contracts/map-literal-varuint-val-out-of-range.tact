contract C {
    get fun test(): Int {
        let m: map<Int, Int as coins> = map<Int, Int as coins> {
            2: pow2(120),
        };
        return m.get(2)!!;
    }
}

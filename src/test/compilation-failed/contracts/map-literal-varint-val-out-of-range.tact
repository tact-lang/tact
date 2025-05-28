contract C {
    get fun test(): Int {
        let m: map<Int, Int as varint32> = map<Int, Int as varint32> {
            2: -pow2(31 * 8 - 1) - 1,
        };
        return m.get(2)!!;
    }
}

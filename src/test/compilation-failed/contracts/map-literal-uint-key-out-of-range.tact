contract C {
    get fun test(): Int {
        let m: map<Int as uint1, Int> = map<Int as uint1, Int> {
            2: 0,    // key 2 is out of range for uint1 (0..1)
        };
        return m.get(2)!!;
    }
}

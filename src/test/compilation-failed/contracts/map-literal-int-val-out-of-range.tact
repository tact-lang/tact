contract C {
    get fun test(): Int {
        let m: map<Int, Int as int4> = map<Int, Int as int4> {
            0: 8,
        };
        return m.get(2)!!;
    }
}

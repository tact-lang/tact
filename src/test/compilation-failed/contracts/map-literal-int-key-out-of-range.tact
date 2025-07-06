contract C {
    get fun test(): Int {
        let m: map<Int as int8, Int> = map<Int as int8, Int> {
            -129: 0,
        };
        return m.get(2)!!;
    }
}

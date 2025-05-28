contract C {
    get fun test(): Int {
        let m: map<Int, Int as uint4> = map<Int, Int as uint4> {
            2: 16,
        };
        return m.get(2)!!;
    }
}

contract TestMissingKey {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         return m.get(55) == null ? 1 : 0;
    }
}

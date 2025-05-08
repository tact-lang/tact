contract TestMapAsCell {
    get fun test() : Int {
       let m: map<Int, Int> = emptyMap();
       // For an empty map, asCell() should return null
       if (m.asCell() != null) { return 1; }
       
       m.set(2, 20);
       // For non-empty map, asCell() should return a non-null Cell
       if (m.asCell() == null) { return 2; }
       return 42;
    }
}

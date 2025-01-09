contract TestContract {
    get fun testEq(s: map<Int,Int>): Bool {
        return s == emptyMap();
    }
    get fun testNeq(s: map<Int,Int>): Bool {
        return s != emptyMap();
    }
}

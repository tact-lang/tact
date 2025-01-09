fun testFunc(m: map<Int, Int>): Int {
    return m.asCell()!!.hash();
}
fun testBlockNoSemicolon(): Int {
    {
        let a: Int = 2 + 2;
        return a
    }
}

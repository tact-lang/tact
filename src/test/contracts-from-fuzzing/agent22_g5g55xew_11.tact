contract TestCompoundConstant() {
    // Testing compound constant evaluation by combining ton() and crc32() built-in functions.
    // Expected: T = ton("1") + crc32("000DEADBEEF000") = 1000000000 + 1821923098 = 2821923098
    const TC: Int = ton("1") + crc32("000DEADBEEF000");

    receive() {
        dump(self.TC);
    }
}

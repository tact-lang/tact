contract ConstEvalNegativeTest {
    get fun something(): Int {
        // the number of shifted bits is too large
        return 0 << 257;
    }
}

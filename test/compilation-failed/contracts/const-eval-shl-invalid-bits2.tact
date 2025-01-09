contract ConstEvalNegativeTest {
    get fun something(): Int {
        // the number of shifted bits cannot be negative
        return 1 << -1;
    }
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return 1 << 256;
    }
}

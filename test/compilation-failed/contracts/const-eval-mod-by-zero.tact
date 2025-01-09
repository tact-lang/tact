contract ConstEvalNegativeTest {
    get fun something(): Int {
        return 2 % 0;
    }
}

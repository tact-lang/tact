contract ConstEvalNegativeTest {
    get fun something(): Int {
        return (false ? 42 : null)!!;
    }
}

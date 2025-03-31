contract PureParams(
    val1: Int as uint64,
    val2: String
) {
    // No contract fields; just a receiver function to use the passed parameters.
    receive() { cashback(sender()) }
}

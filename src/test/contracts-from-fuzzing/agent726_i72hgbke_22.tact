// Use contract parameters with mixed types and optional params
contract ParamsMix(
    val1: Int,
    val2: Bool,
    val3: String,
    opt1: Int?,
    opt2: Bool?,
    opt3: String?,
) {
    receive() {
        // dummy receive to ensure compilation
    }
}
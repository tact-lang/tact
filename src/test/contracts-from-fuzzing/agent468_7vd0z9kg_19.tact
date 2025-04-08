// Contract with contract parameters and valid empty receive
contract ParamMode(
    a: Int,
    b: Bool,
    s: String,
    opt: Int?,
    optStr: String?
) {
    receive() {
        // empty body
    }
}
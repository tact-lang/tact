contract ParamContract(x: Int) {}

fun main() {
    // Valid usage: contract with parameters, initOf receives constructor arguments
    let pkg = initOf ParamContract(42);
    // Using codeOf on a contract with parameters: parameters are not needed for codeOf
    let code = codeOf ParamContract;
}

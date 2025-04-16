contract TestContract {
    init() {}
    receive() {}
}

fun main() {
    let initPkg = initOf TestContract();
    let codeCell = codeOf TestContract;
}

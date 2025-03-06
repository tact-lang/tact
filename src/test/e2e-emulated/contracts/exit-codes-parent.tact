import "./exit-codes-child";

contract ExitCodesParent {
    receive() {}
    get fun firstExitCode() {
        require(false, "first");
        return;
    }
    get fun secondExitCode() {
        require(false, "second");
        return;
    }
}

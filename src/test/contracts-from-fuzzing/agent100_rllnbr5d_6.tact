contract Empty {}

contract TestEmpty {
    receive() {
        let initEmpty = initOf Empty();
        let codeEmpty = codeOf Empty;
    }
}

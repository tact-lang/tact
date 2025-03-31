contract Empty {}

contract TestEmpty {
    receive() {
        // Valid usage with an empty contract having an implicit empty init
        let s: StateInit = initOf Empty();
        let c = codeOf Empty;
    }
}

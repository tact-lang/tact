contract WithParams(param: Int) {}

contract TestWithParams {
    receive() {
        let s: StateInit = initOf WithParams(42);
    }
}

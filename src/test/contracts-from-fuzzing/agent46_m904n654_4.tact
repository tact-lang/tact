contract C {}

contract Test2 {
    receive() {
        let state: StateInit = initOf C();
    }
}

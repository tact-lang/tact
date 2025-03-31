contract Simple {
    receive() {}
}

contract Test {
    receive() {
        let s_init = initOf Simple(); // compute full initial state
        let s_code = codeOf Simple;   // compute code cell
    }
}

const TERNARY: Int = (true ? 10 : 20);

contract TestTernary {
    receive() {
        let v = TERNARY; // expected value: 10
    }
}

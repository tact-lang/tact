struct WithDefaults {
    x: Int = 10;
    y: Bool = false;
}

contract ParamsAndDefaults(
    a: Int,
    b: WithDefaults,
    c: WithDefaults? 
) {
    receive() {
        let _ = self.a + self.b.x;
    }
}
message Example {
    a: Int;
    b: Int?;
}

contract Test {
    receive(e: Example) {
        let z = e.b;
    }
}
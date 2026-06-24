struct DefaultTest {
    a: Int;
    b: Int = 100;
}

contract TestDefault {
    receive() {
        let t = DefaultTest { a: 42 };
        let s = t.a + t.b; // should be 142
    }
}

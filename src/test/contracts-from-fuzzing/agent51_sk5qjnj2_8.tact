struct WithDefault {
    a: Int = 10;
    b: Int;
}

contract TestDefault {
    receive() {
        let w: WithDefault = WithDefault { b: 5 };
        dump(w.a);  // expected 10 (default value)
        dump(w.b);  // expected 5
    }
}

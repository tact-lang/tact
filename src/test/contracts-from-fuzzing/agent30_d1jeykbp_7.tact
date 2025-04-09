struct Defaults {
    a: Int = 10;
    b: Int;
}

contract TestDefaults {
    receive() {
        let d: Defaults = Defaults{ b: 20 };
        d.a; // should be 10
    }
}

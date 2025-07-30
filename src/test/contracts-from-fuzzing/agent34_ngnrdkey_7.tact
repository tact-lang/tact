struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner?;
    val: Int;
}

contract OptionalDeepTest {
    receive() {
        // Instantiate Outer with a null optional inner struct
        let o = Outer{ inner: null, val: 999 };
    }
}

struct S {
    a: String;
}

fun getS(): S {
    return S{ a: "Hello, world!" };
}

contract Test {
    receive() {
        let s: S = getS();
        if (s.a == "Hello, world!") {
            // Correct behavior
        } else {
            throw(1);
        }
    }
}

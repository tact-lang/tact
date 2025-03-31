struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner?;
    text: String;
}

contract TestNested {
    receive() {}

    // Getter returning a deeply nested structure with an optional field
    get fun getNested(): Outer? {
        return Outer {
            inner: Inner { a: 10, b: true },
            text: "Hello"
        };
    }
}

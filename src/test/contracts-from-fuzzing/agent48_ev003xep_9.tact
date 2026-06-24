struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestNestedGetter {
    // Persistent state variable of a nested optional struct type
    state: Outer = Outer{ inner: null };

    receive() {}

    // Getter returning a nested composite type
    get fun getOuter(): Outer {
        return self.state;
    }
}

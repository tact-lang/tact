struct Inner {
    v: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNestedComposite {
    // State variable with nested composite types
    o: Outer = Outer {
        inner: Inner { v: 999 },
        flag: true
    };

    // Getter that returns the nested composite type
    get fun getNested(): Outer {
        return self.o;
    }

    receive() {
        let value = self.getNested();
    }
}

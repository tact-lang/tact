struct Level3 {
    a: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TestDeepNested {
    receive() {
        let x = Level1 { nested: Level2 { inner: Level3 { a: 42 } } };
        let y = x.nested.inner.a;
    }
}

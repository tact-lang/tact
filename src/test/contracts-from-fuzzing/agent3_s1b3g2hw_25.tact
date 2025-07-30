struct MaybeFoo {
    foo: Foo?;
}

struct Foo {
    x: Int;
}

contract Test {
    receive() {
        let x: MaybeFoo? = null;
    }
}
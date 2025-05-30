struct Foo {
    x: Int;
}

contract TestOptUnwrap {
    receive() {
        let f: Foo? = Foo { x: 42 };
        if (f != null) {
            dump(f!!.x);
        }
    }
}

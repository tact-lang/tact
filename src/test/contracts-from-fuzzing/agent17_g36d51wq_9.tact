struct Foo { x: Int }

contract TestFieldAccess {
    receive() {
        let f: Foo = Foo { x: 150 };
        dump(f.x); // Expect output: 150
    }
}

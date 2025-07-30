struct Foo { x: Int; }

contract OptionalStructDefaulted {
    bar: Foo? = null;

    init() {
        // optional remains null
    }
}
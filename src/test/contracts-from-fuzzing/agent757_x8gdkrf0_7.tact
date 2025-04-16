struct Foo { x: Int; }

contract TestContract {
    bar: Foo? = null; 

    init() {
        // no assignment here, relies on field default null
    }
}
struct Stuff {
    a: Int;
}

contract TestContract {
    opt: Stuff?;

    init() {
        // leave opt unset, should default to null
    }
}
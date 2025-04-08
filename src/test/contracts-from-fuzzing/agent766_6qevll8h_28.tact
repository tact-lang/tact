// testing optional of composite type used as contract parameter
struct Bundle {
    foo: Int;
    bar: Bool;
}

contract Test(
    stuff: Bundle?
) {
    // constructor param only
}
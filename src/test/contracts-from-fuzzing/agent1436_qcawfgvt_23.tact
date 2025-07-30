// Persistent state variable with default optional struct = null
struct Inner {
    a: Int;
}

contract TestContract {
    optField: Inner?;

    init() {}
}

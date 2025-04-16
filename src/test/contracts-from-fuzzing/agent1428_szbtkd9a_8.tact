struct Simple {
    a: Int;
    b: Bool;
}

contract TestContract {
    val1: Simple = Simple{ a: 1, b: true };
    val2: Simple = Simple{ a: 2, b: false };
}
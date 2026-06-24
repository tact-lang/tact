trait A {
    a: Int;
}

trait B {
    a: Int;
}

// Attempt to inherit two traits that both require a field with the same name 'a'
contract C(a: Int) with A, B {
    receive() { }
}

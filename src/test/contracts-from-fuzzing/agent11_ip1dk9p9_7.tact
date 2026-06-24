trait A {
    const BAR: Int = 1;
}

trait B {
    const BAR: Int = 2;
}

contract C() with A, B {
    override const BAR: Int = 3;
    receive() { }
}

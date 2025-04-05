trait A {
    abstract const X: Int;
}

trait B {
    abstract const X: Int;
}

contract C() with A, B {
    override const X: Int = 100;
    receive() {
         dump(self.X);
    }
}

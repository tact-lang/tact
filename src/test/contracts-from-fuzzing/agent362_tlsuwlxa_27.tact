struct Foo { x: Int }

contract TestContract {
    s: Foo?;

    receive() {
        if (self.s == null) {
            self.s = Foo{ x: 1 };
        }
    }
}
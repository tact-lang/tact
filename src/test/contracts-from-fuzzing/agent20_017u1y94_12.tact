extends mutates fun doubleInPlace(self: Int) {
    self += self;
}

contract Test {
    receive() {
        let x: Int = 5;
        x.doubleInPlace();
        dump(x); // Expecting 10
    }
}

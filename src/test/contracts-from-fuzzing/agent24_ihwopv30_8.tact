trait T {
    x: Int;
}

contract C(x: Int) with T {
    receive() {
        dump(self.x);
    }
}

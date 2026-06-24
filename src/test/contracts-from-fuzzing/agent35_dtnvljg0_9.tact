trait T {
    a: Int; // persistent field required by trait
}

contract C(a: Int) with T {
    receive() {
        dump(self.a);
    }
}

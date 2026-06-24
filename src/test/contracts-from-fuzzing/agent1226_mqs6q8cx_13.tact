struct Small {
    x: Int;
}

contract Parameters(
    a: Small,
    b: Small,
    c: Small,
) {
    receive() {
        dump(self.a.x + self.b.x + self.c.x);
    }
}
trait T {
    a: Int = 42; // error

    get fun getA(): Int {
        return self.a;
    }
}

contract Test with T {
    a: Int = 19;
}


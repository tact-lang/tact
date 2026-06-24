struct Pair {
    a: Int;
    b: Int;
}

contract TestStruct {
    a: Int = 10;
    b: Int = 20;
    receive() {}
    get fun getPair(): Pair {
        return Pair { a: self.a, b: self.b };
    }
}

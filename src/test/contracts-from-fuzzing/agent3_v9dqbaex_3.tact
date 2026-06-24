struct Pair {
    a: Int;
    b: Int;
}

contract TestStruct {
    p: Pair = Pair { a: 1, b: 2 };

    receive() {}

    get fun getPair(): Pair {
         return self.p;
    }
}

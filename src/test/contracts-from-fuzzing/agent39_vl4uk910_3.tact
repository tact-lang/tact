struct Pair {
    a: Int;
    b: Bool;
}

contract Test3 {
    p: Pair = Pair{ a: 10, b: true };
    
    receive() {}

    get fun getPair(): Pair {
        return self.p;
    }
}

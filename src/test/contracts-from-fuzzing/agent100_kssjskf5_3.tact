struct Pair { first: Int; second: Bool }

contract TestGetterStruct {
    p: Pair = Pair{ first: 99, second: false };
    
    receive() {}
    
    get fun getPair(): Pair {
        return self.p;
    }
}

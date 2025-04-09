struct Pair { first: Int; second: Int; }

contract TestGetterTuple {
    get fun getPair(flag: Bool): Pair {
        if (flag) {
            return Pair{ first: 10, second: 20 };
        } else {
            return Pair{ first: 30, second: 40 };
        }
    }
    
    receive() {}
}

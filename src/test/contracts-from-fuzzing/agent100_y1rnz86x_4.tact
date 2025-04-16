struct MyTuple { a: Int; b: Int; }

contract Test {
    get fun getTuple(): MyTuple {
        if (1 > 0) {
            return MyTuple{ a: 1, b: 2 };
        } else {
            return MyTuple{ a: -1, b: -2 };
        }
    }
}

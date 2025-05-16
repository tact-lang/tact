struct MyTuple { a: Int; b: Int; }

contract TestGetter {
    v: Int = 0;

    // Getter with conditional branches: returns a constant depending on parameter
    get fun getValue(x: Int): Int {
        if (x == 10) { return 100; }
        return 200
    }

    // Getter with tuple struct return
    get fun getTuple(x: Int): MyTuple {
        if (x == 0) { return MyTuple { a: 1, b: 2 } } else { return MyTuple { a: 3, b: 4 } }
    }
}

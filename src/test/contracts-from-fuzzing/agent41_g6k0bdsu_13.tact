fun double(x: Int): Int {
    return x * 2;
}

contract TestFuncCall {
    receive() {
        // Inline function call and chained extension function call on literal
        // double(21) should yield 42 and then converted to string
        let result: String = double(21).toString();
        dump(result);
    }
}

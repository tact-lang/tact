struct Pair {
    first: Int;
    second: Int;
}

contract GetterStruct {
    receive() {}

    get fun getPair(): Pair {
        return Pair{
            first: 1,
            second: 2
        };
    }
}

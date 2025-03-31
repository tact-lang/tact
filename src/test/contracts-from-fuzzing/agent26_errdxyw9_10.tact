contract Duplicate {
    init(v: Int) { }
}

struct DoubleRefState {
    first: StateInit;
    second: StateInit;
}

contract DoubleRef {
    fun getDouble() : DoubleRefState {
        return DoubleRefState{
            first: initOf Duplicate(5),
            second: initOf Duplicate(5)
        };
    }
}

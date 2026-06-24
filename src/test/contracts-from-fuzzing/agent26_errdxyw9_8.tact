contract M {
    init(x: Int) { }
}

contract N {
    init(y: Int) { }
}

struct TwinState {
    stateM: StateInit;
    stateN: StateInit;
}

contract P {
    fun combinedInit() : TwinState {
        return TwinState{
            stateM: initOf M(10),
            stateN: initOf N(20)
        };
    }
}

struct Wrapper {
    inner1: Int;
    inner2: Bool;
    inner3: Cell;
    inner4: Address;
}

contract TestContract {
    wrapped: Wrapper;
    
    init() {
        self.wrapped = Wrapper{
            inner1: 10,
            inner2: false,
            inner3: emptyCell(),
            inner4: myAddress(),
        };
    }
}
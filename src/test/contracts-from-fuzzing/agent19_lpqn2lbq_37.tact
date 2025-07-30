struct OptNested {
    n: Int?;
}

contract TestContract {
    o: OptNested;

    init() {
        self.o = OptNested{n: null};
    }
}
struct Embedded {
    n: Int;
}

contract TestContract {
    optStruct: Embedded?;

    init() {
        self.optStruct = Embedded{n: 42};
    }
}
struct S { x: Int? }

contract TestContract {
    optStruct: S;

    init() {
        self.optStruct = S{ x: null };
    }
}
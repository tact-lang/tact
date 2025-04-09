struct S{
    f1: Int;
}

contract TestContract {
    stored: S?;

    init() {
        self.stored = null;
    }
}
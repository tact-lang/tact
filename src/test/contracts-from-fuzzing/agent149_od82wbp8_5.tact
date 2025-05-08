struct S {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: S?;

    init() {
        // no initialization, data stays `null`
    }
}
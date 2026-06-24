struct S {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    data: S?;

    init() {
        self.data = null;
    }
}
struct S {
    x: String = "x";
    y: Int;
    z: Bool?;
}

contract TestContract {
    optStruct: S? = null;

    init() {
        self.optStruct = S{ y: 42, z: null };
    }
}
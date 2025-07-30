struct S1 {
    x: Int;
    y: Int;
    z: Int;
}

contract ThreeIntsOptionals {
    data: S1?;

    init() {
        self.data = null;
    }
}
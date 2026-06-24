struct Wrapper {
    val: Int;
}

contract ComboTest {
    x: Int;
    y: Bool;
    z: Wrapper;

    init() {
        self.x=5;
        self.y=true;
        self.z=Wrapper{val:7};
    }
}
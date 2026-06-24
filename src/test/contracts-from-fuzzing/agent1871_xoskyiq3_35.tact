struct Wrapper {
    inner: Int;
}

contract WrapTest {
    x: Wrapper;
    y: Wrapper;
    z: Wrapper;

    init() {
        self.x = Wrapper{ inner: 1 };
        self.y = Wrapper{ inner: 2 };
        self.z = Wrapper{ inner: 3 };
    }
}
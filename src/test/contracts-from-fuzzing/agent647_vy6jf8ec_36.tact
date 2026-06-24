struct PaddingTest {
    u4: Int as uint4;
    u3: Int as uint3;
    i7: Int as int7;
    b: Bool;
}

contract PadTest {
    f: PaddingTest;

    init() {
        self.f = PaddingTest{u4: 8, u3: 5, i7: 64, b:true};
    }
}
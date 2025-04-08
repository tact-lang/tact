struct DefaultsMix {
    x: Int = 10;
    y: Bool;
    z: String = "hello";
    w: Slice;
}

contract MixedDefaultsTest {
    d: DefaultsMix;

    init() {
        self.d = DefaultsMix{ y: false, w: emptyCell().asSlice() };
    }
}
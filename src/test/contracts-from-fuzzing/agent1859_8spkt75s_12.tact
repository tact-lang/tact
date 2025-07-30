struct WidthTest {
    big: Int as int257;
    mid: Int as int64;
    small: Int as uint8;
}

contract IntWidths {
    data: WidthTest;
    init() {
        self.data = WidthTest{
            big: -1,
            mid: -64,
            small: 255
        };
    }
}
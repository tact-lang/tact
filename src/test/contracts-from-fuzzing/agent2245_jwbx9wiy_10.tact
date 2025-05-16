struct IntOptions {
    i1: Int?;
    i2: Int?;
    i3: Int?;
    i4: Int?;
    i5: Int?;
}

contract FuzzTest {
    opts: IntOptions;

    init() {
        self.opts = IntOptions{
            i1:null, i2:1, i3:null, i4:4, i5:null
        };
    }
}

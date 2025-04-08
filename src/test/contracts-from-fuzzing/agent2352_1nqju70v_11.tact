struct AllOpts {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptStructTest {
    val: AllOpts;

    init() {
        self.val = AllOpts{
            y: true
        };
    }
}
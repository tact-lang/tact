contract MixedConsts {
    x: Int = 2 * 21;
    y: Bool = (5 > 4);
    z: Int = crc32("abc") + 1;

    init() {
        self.x = -1;
        self.y = false;
        self.z = 0;
    }
}
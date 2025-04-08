contract OptSerBugTest {
    x: Int? as uint4;
    y: Int? as int64;
    z: Int? as uint32;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}
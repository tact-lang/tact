contract SerializeLimits {
    min257: Int as int257;
    max257: Int as int257;

    init() {
        self.min257 = -170141183460469231731687303715884105728; // -2**127
        self.max257 = 170141183460469231731687303715884105727;  // 2**127 - 1
    }
}
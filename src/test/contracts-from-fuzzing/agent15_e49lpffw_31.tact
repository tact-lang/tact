// Now break with conflicting serialization directives
contract SerializeConflict {
    a: Int as uint8;
    b: Int as int8;

    init() {
        self.a = 128;
        self.b = -129;
    }
}
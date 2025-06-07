// conflicting serialization formats

struct Conflict {
    a: Int as uint32;
    b: Int as int257;
}

contract ConflictTest {
    c: Conflict;
    init() {
        self.c = Conflict{ a: 42, b: 43 };
    }
}
// Try multiple optional nested structs assigned null at various levels
struct Z {
    v: Int?;
}

struct Y {
    z: Z?;
}

struct X {
    y: Y?;
}

contract NullNestedAll {
    f: X?;

    init() {
        self.f = null;
    }
}
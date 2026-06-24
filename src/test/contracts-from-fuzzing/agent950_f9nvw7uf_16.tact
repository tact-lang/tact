// long nested optional chain involving structs with optionals
struct X {
    y: Y?;
}

struct Y {
    z: Z?;
}

struct Z {
    a: Int?;
}

contract OptionChain {
    d: X?;

    init() {
        self.d = null;
    }
}
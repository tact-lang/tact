// Test large optional struct chain
struct Z {
    q: Int?;
}

struct Y {
    z: Z?;
}

struct X {
    y: Y?;
}

contract DeepOptionals {
    val: X?;

    init() {
        self.val = null;
    }
}
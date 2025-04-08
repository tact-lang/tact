// Test default values for inner nested structs optional
struct Inn {
    x: Int = 5;
}

struct Out {
    inn: Inn = Inn{};
    flag: Bool = true;
}

contract NestedDefaults {
    val: Out;
    init() {
        self.val = Out{};
    }
    receive() {
        self.val.inn.x += 1;
    }
}
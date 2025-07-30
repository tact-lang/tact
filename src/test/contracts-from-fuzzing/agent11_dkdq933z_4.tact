// Test contract field with multiple nested optional fields

struct Deep {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract TestContract {
    a: Deep?;

    init() {
        self.a = null;
    }
}
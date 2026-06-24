// Test struct default values
struct Defaults {
    a: Int = 123;
    b: Bool = true;
    c: Int?; // implicitly null
}

contract TestContract {
    x: Defaults;

    init() {
        self.x = Defaults{
            // omit a and b to get defaults
            c: null,
        };
    }
}
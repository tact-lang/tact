// Struct where a bool field has an explicit default and one missing default
struct Stuff {
    a: Bool = true;
    b: Int;
}

contract TestContract {
    s: Stuff;
    init() {
        self.s = Stuff{
            b: 42,
        };
    }
}

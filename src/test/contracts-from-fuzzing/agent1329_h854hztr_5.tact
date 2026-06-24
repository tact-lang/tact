struct OptA { a: Int?; }
struct OptB { b: OptA?; }

contract NestedOptionals {
    data: OptB;

    init() {
        self.data = OptB{ b: null };
    }
}

struct OptInt { x: Int?; }
struct OptStruct { s: OptInt?; }

contract TestContract {
    s: OptStruct?;

    init() {
        self.s = null;
    }
}

struct S1 { a: Int }
struct OptS1 { s: S1? }

contract TestContract {
    s: OptS1;

    init() {
        self.s = OptS1{s: S1{a:17}};
    }
}
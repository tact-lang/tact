struct DocOrder1 { f: Int; g: Bool }
struct DocOrder2 { g: Bool; f: Int }

contract TestContract {
    a: DocOrder1;
    b: DocOrder2;

    init() {
        self.a = DocOrder1{ f: 1, g: false };
        self.b = DocOrder2{ g: true, f: 2 };
    }
}
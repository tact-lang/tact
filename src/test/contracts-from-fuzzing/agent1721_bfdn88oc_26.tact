// chains of nested structs with large optionals in the middle
struct Chain1 { next: Chain2?; }
struct Chain2 { next: Chain3?; }
struct Chain3 { val: Int?; }

contract ChainOfOptionals {
    root: Chain1;
    init() {
        self.root = Chain1 { next: null };
    }
}

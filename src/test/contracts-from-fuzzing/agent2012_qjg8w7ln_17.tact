struct Chain3 { x: Int; }
struct Chain2 { next: Chain3; }
struct Chain1 { next: Chain2; }

contract OptionalNested {
    root: Chain1?;

    init() {
        self.root = Chain1{ next: Chain2{ next: Chain3{ x: 5 } } };
    }
}
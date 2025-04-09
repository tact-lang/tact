struct BigNested1 { a: Int; b: Bool; }
struct BigNested2 { c: Int; d: Bool; }
struct BigNested3 { e: Int; f: Bool; }
struct BigNested4 { g: Int; h: Bool; }

struct Container {
    n1: BigNested1;
    n2: BigNested2;
    n3: BigNested3;
    n4: BigNested4;
}

contract LotsOfStructs {
    data: Container;

    init() {
        self.data = Container{
            n1: BigNested1{ a: 1, b: true },
            n2: BigNested2{ c: 2, d: false },
            n3: BigNested3{ e: 3, f: true },
            n4: BigNested4{ g: 4, h: false },
        };
    }
}

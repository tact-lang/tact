struct PartA { a: Int }
struct PartB { b: String }
struct PartC { c: Bool }

struct Composite {
    partA: PartA;
    partB: PartB;
    partC: PartC;
}

contract MultiNest {
    field: Composite;

    init() {
        self.field = Composite{
            partA: PartA{a:1},
            partB: PartB{b:"hi"},
            partC: PartC{c:true}
        };
    }
}
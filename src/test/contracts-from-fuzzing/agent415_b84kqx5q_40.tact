struct RecA { next: RecB? }
struct RecB { next: RecC? }
struct RecC { end: Int }

contract StructureOptRecursion {
    foo: RecA;

    init() {
        self.foo = RecA{next: null};
    }
}
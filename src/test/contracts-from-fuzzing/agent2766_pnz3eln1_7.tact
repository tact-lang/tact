struct InnerA { a: Int; }
struct InnerB { b: Int; }

struct Combining {
    one: InnerA;
    two: InnerB;
    val: Int;
}

contract CombineStructs {
    combined: Combining;

    init() {
        self.combined = Combining{
            one: InnerA{a: 10},
            two: InnerB{b: 20},
            val: 30,
        };
    }
}
// optional complex nested within optional
struct InnerNested {
    val: Int;
}

struct Outer {
    inr: InnerNested?;
}

contract OptionInOption {
    o: Outer?;

    init() {
        self.o = null;
    }
}
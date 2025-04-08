// Passing struct as optional
struct SOpt {
    x: Int;
    y: String;
}

contract StructOptional {
    opt: SOpt?;

    init() {
        self.opt = null;
    }
}
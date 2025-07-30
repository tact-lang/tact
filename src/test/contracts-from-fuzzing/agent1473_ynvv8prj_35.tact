struct NestCell {
    c: Cell;
    nested: Nested;
}

struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    nc: NestCell;

    init() {
        self.nc = NestCell{ c: emptyCell(), nested: Nested{a:1,b:true} };
    }
}
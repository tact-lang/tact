// optional Slice and Cell fields, nested in struct
struct ContainsRefs {
    s: Slice?;
    c: Cell?;
}

contract TestContract {
    x: ContainsRefs?;

    init() {
        self.x = null;
    }
}
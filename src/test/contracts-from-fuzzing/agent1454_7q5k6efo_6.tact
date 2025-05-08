struct FlatOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract FlatOptionalStorage {
    fs: FlatOptionals;

    init() {
        self.fs = FlatOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }

    receive() {
        if (self.fs.c != null) {
            let _ = self.fs.c!!;
        }
    }
}
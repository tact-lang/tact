struct TinyNest {
    inn: Int;
}

struct TinyWrapper {
    nest: TinyNest;
}

contract TinyWrapContract {
    field: TinyWrapper = TinyWrapper{ nest: TinyNest{ inn: 7 } };

    init() {
        self.field = TinyWrapper { nest: TinyNest { inn: 77 } };
    }
}
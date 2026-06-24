struct Detail {
    item: String;
    price: Int;
}

struct Wrapper {
    count: Int;
    detail: Detail;
    note: String;
}

contract StructOfStructs {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            count: 5,
            detail: Detail{ item: "Book", price: 99 },
            note: "Library"
        };
    }
}
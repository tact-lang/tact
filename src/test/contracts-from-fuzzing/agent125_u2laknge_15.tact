// Combined optional and normal fields
struct Combo {
    a: Int;
    b: Bool?;
    c: Int?;
    d: String;
    e: Bool;
}

contract ComboStore {
    data: Combo;

    init() {
        self.data = Combo{
            a: 10,
            b: null,
            c: 20,
            d: "hi",
            e: true,
        };
    }
}
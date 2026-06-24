// test large optional + default variety
struct Versatile {
    a: Int;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String;
    f: String?;
}

contract VersatileHolder {
    content: Versatile;
    init() {
        self.content = Versatile{
            a: 10,
            b: null,
            d: null,
            e: "tact",
            f: null
        };
    }
}
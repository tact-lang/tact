// Mixing optionals, nested structs, multiple types
struct Nested {
    s: String?;
    flag: Bool;
}

contract Complex {
    value1: Int?;
    nested: Nested?;
    txt: String;
    switch: Bool?;

    init() {
        self.value1 = null;
        self.nested = null;
        self.txt = "hi";
        self.switch = null;
    }
}
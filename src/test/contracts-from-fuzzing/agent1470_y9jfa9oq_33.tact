// combination of optionals and default values
struct Combo {
    a: Int = 1;
    b: Bool?;
    c: String = "a";
    d: Bool = false;
    e: Int?;
}

contract DefaultsOptionals {
    content: Combo;

    init() {
        self.content = Combo{b: null, e: null};
    }
}
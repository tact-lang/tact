// nesting a struct with both default and no-default fields
struct Mixed {
    a: Int;            // no default, must assign
    b: Bool?;          // optional, default null
    c: Int = 5;        // has default
    d: String? = null; // optional defaulted explicitly
}

contract HasMixed {
    m: Mixed;

    init() {
        self.m = Mixed{ a:1 };
    }
}

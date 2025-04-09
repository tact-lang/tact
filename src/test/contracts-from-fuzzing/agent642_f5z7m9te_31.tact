// nested optional + default values
struct Inner {
    x: Int = 5;
    y: Bool?;
}

struct Outer {
    nested: Inner?;
}

contract DefValOpt {
    data: Outer;

    init() {
        self.data = Outer{ nested: null };
    }
}
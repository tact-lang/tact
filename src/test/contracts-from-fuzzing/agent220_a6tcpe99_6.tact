struct ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Wrapper {
    x: ManyFields;
    y: Int = 42;
}

contract DeepFields {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            x: ManyFields{},
            y: 100
        };
    }

    receive() {}
}
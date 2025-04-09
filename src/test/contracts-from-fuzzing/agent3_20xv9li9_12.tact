struct Defaults {
    a: Int = 10;
    b: Bool = false;
    s: String = "hi there";
}

contract DefaultStructs {
    data: Defaults;

    init() {
        self.data = Defaults{
            a: 42,
            // b and s omitted
        };
    }
}
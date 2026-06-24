struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Optionals {
    vals: ManyOptional;

    init() {
        self.vals = ManyOptional{
            a: null,
            b: true,
            c: null
        };
    }
}
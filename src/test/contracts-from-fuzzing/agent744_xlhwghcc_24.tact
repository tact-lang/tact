struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: 2, c: null, d: false, e: null, f: "hi"
        };
    }
}
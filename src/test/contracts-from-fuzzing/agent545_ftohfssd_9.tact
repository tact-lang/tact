struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: String?;
}

contract TestContract {
    optStruct: ManyOptionals;

    init() {
        self.optStruct = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }

    receive() {}
}
struct BoolStruct {
    a: Bool? = null;
    b: Bool? = true;
    c: Bool? = false;
    d: Bool?;
    e: Bool = true;
    f: Bool = false;
}

contract TestContract {
    data: BoolStruct;

    init() {
        self.data = BoolStruct{
            a: true,
            b: false,
            c: true,
            d: null,
            e: false,
            f: true
        };
    }
}
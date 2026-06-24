struct Compose {
    si: IntAndString;
    optInt: Int?;
    optStr: String?;
}

struct IntAndString {
    a: Int;
    b: String;
}

contract ComposeContract {
    data: Compose;

    init() {
        self.data = Compose{
            si: IntAndString{a:1,b:"z"},
            optInt: null,
            optStr: null
        };
    }
}
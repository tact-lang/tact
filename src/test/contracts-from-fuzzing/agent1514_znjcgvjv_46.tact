struct Base {
    a: Int;
}

struct Embedded {
    b: Base?;
}

contract OptionalInStruct {
    val: Embedded;

    init() {
        self.val = Embedded{
            b: null
        };
    }
}
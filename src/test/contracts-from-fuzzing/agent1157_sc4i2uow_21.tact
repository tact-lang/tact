struct MidStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    one: Int;
    two: MidStruct;
    three: String?;
}

contract RefReuse {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            one: -123,
            two: MidStruct{ a: 456, b: false },
            three: null
        };
    }
}
struct Mid {
    val: Int;
    label: String;
}

struct OuterOpt {
    data: Mid?;
    number: Int;
}

contract OptionalMiddleStruct {
    st: OuterOpt;

    init() {
        self.st = OuterOpt{
            data: null,
            number: 9
        };
    }
}
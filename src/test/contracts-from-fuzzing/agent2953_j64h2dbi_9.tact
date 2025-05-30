struct OptionalMiddle {
    inn: Int;
    maybe: String?;
}

struct MaybeOuter {
    m: OptionalMiddle?;
}

contract OptionalsInStructs {
    data: MaybeOuter;

    init() {
        self.data = MaybeOuter{
            m: OptionalMiddle{
                inn: 7,
                maybe: null,
            }
        };
    }
}
struct OptionalInnerStruct {
    q: Int;
    p: Bool;
}

struct OuterStruct {
    optionalInner1: OptionalInnerStruct?;
    optionalInner2: OptionalInnerStruct?;
    done: Bool;
}

contract OptionalDeep {
    content: OuterStruct = OuterStruct{
        optionalInner1: null,
        optionalInner2: null,
        done: false
    };

    init() {
        self.content = OuterStruct{
            optionalInner1: OptionalInnerStruct{q: 1, p: true},
            optionalInner2: null,
            done: true
        };
    }
}
struct MiddleStruct {
    val: Int;
}

struct OuterStructOpt {
    mid: MiddleStruct?;
}

contract OptionalMiddleNested {
    field: OuterStructOpt;

    init() {
        self.field = OuterStructOpt{mid: null};
    }
}
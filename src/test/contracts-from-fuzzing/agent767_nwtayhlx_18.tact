message(1001) MessageGuts {
    value: Int;
}

struct Inner {
    guts: MessageGuts?;
}

struct Outer {
    inner: Inner?;
}

contract OptionalNestEdge {
    payload: Outer?;

    init() {
        self.payload = Outer{
            inner: Inner{
                guts: MessageGuts{ value: 999 }
            }
        };
    }
}

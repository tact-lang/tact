struct InnerOpt {
    maybeField: Int?;
}

struct OuterOpt {
    innerOpt: InnerOpt;
    x: Int;
}

contract TestNestedOptionalsPresent {
    receive() {
        let msg: OuterOpt = OuterOpt {
            innerOpt: InnerOpt { maybeField: 123 },
            x: 456
        };
    }
}

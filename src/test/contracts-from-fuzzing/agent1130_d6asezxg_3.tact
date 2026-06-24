struct NestedOptional {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    someValue: Int?;
}

contract OptionalStruct {
    data: NestedOptional = NestedOptional{ maybeInner: null };

    receive() {
        // do nothing
    }
}
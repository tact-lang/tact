struct OptionalStruct {
    a: Int;
    b: Int?;
}

contract TestOptional {
    receive() {
        let s = OptionalStruct {
            a: 111,
            b: 222
        };
    }
}

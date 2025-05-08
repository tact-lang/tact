struct OptionalStruct {
    Opt: Int?;
}

contract TestOptional {
    receive() {
        let os: OptionalStruct = OptionalStruct{ Opt: 123 };
    }
}

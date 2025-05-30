struct OptionalStruct {
    x: Int?;
}

contract TestOptional {
    receive() {
        let os: OptionalStruct = OptionalStruct { x: null };
        return;
    }
}

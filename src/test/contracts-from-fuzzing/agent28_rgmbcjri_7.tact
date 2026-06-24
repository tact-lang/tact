struct OptionalStruct {
    Maybe: Int?;
}

contract TestOptional {
    receive() {
        let opt: OptionalStruct = OptionalStruct { Maybe: 42 };
        dump(opt.Maybe);
    }
}

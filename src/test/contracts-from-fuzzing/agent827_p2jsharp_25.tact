struct MaybeNumber {
    value: Int?;
}

contract OptionalFieldStruct {
    myVal: MaybeNumber = MaybeNumber{ value: null };

    receive() {
        self.myVal = MaybeNumber{ value: 555 };
    }
}
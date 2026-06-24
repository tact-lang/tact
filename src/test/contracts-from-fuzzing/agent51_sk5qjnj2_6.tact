struct OptionalStruct {
    val: Int?;
}

contract TestOptional {
    receive() {
        let o = OptionalStruct { val: 456 };
        dump(o.val);
    }
}

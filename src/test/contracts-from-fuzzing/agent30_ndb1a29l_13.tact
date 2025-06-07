struct OptionalStruct {
    x: Int?;
}

contract TestContract {
    receive() {
        let o = OptionalStruct{ x: null };
    }
}
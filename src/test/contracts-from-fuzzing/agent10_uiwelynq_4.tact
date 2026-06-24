message OptionalField {
    value: Int?;
}

contract TestContract {
    receive(msg: OptionalField) {
    }
}
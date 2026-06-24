struct Info {
    number: Int;
    name: String;
}

contract TestContract(
    field: Info,
) {
    receive() {
        let _ = self.field.name;
    }
}
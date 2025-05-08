struct Info {
    label: String?;
    count: Int;
}

contract TestContract(
    header: Info?,
    active: Bool,
    owner: Address
) {
    receive() {
        let _ = self.owner;
    }
}
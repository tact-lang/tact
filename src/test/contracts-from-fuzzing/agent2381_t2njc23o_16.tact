struct Nested { val: Int; }

contract TestContract(
    info: Nested,
) {
    get fun get_info(): Nested {
        return self.info;
    }
}
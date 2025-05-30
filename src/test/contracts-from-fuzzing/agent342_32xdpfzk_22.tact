// deeply nested parametrized contract
contract Test21(
    x: Int,
    y: Bool?,
    z: Address?
) {
    receive() {}

    get fun sum(): Int {
        return self.x + (self.y != null ? 1 : 0) + (self.z != null ? 1 : 0);
    }
}
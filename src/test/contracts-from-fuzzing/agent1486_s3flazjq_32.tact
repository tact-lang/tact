contract NestedOptional(
    a: Int?,
    b: String?,
    c: Bool?,
) {}

contract WithInit {
    x: Int;
    init() {
        self.x = 999;
    }
}

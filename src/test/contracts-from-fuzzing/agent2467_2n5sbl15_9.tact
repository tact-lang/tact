struct OptNested { inner: Int?; }

contract DoubleOptional {
    val: OptNested?;
    init() { self.val = null; }
}
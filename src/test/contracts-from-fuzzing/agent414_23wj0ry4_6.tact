struct X { u: Int; v: Int }

contract OptionalStructField {
    maybeX: X?;
    magic: Int;

    init() {
        self.maybeX = null;
        self.magic = 123;
    }
}
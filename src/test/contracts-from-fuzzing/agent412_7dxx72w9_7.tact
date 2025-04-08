struct Foo { x: Int; y: Bool }

contract NullableStructField {
    maybeData: Foo? = null;

    receive() {
        if (self.maybeData != null) {
            let _ = self.maybeData!!;
        }
    }
}
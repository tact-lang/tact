struct S { a: Int?; }

contract OptionalOuter {
    x: S?;

    receive() {
        let _ = self.x;
    }
}
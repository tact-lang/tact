struct OptionalStringBool {
    s: String?;
    b: Bool?;
}

contract StructOptionStringBool {
    p: OptionalStringBool = OptionalStringBool{ s: null, b: false };
    receive() {
        let _ = self.p.b;
    }
}
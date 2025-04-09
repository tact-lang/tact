struct NestedString {
    label: String;
}
contract WithStringInit {
    nested: NestedString;

    init() {
        self.nested = NestedString{
            label: "hello world"
        };
    }
}
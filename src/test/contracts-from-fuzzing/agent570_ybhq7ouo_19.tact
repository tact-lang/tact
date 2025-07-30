struct OptPoint {
    x: Int;
    y: Int;
    label: String?;
}

contract MissingOptionalInit {
    op: OptPoint;

    init() {
        self.op = OptPoint{
            x: 10,
            y: 20
            // omit 'label', should default to null
        };
    }

    receive() {}
}
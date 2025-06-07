struct OptionalNested {
    x: Int?;
    y: Int?;
}

contract OptionalFieldTest {
    data: OptionalNested?;

    init() {
        self.data = OptionalNested { x: 42, y: null };
    }

    receive() {
        if (self.data != null) {
            let x = self.data!!.x;
            let y = self.data!!.y;
        }
    }
}

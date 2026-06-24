struct OptWrapper { x: Int? }

contract OptTest {
    field: OptWrapper;

    init() {
        self.field = OptWrapper{ x: null };
    }
}
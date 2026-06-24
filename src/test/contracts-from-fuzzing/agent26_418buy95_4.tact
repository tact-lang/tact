struct OptionalStruct { val: Int? }

contract OptTest {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{ val: null };
    }
}
struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalTest {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{
            a: 7,
            b: true,
        };
    }
}
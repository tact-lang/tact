struct OptionalAndDefault {
    a: Int?;
    b: Bool = false;
}

contract OptDefTest {
    dat: OptionalAndDefault;

    init() {
        self.dat = OptionalAndDefault{
            a: null,
        };
    }
}
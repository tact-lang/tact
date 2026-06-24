struct OptionalStringStruct {
    strOpt: String?;
}

struct ContainerOptString {
    inner: OptionalStringStruct?;
}

contract OptionalStringTest {
    s: ContainerOptString;

    init() {
        self.s = ContainerOptString{
            inner: OptionalStringStruct{ strOpt: null }
        };
    }
}
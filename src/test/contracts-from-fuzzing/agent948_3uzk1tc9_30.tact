struct OptStr {
    foo: String?;
    bar: String?;
}

contract OptStringTest {
    state: OptStr;

    init() {
        self.state = OptStr{
            foo: null,
            bar: "nonull"
        };
    }
}
struct OptStr {
    opt: String?;
}

contract OptStrTest {
    dat: OptStr;

    init() {
        self.dat = OptStr{
            opt: null
        };
    }
}
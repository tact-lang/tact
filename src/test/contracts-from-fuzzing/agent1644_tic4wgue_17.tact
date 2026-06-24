struct OptBool {
    yes: Bool?;
    no: Bool?;
    maybe: Bool?;
}

contract TestContract {
    status: OptBool;

    init() {
        self.status = OptBool{ yes: null, no: null, maybe: null };
    }
}
struct DefaultOptional {
    a: Int? = null;
    b: Bool? = false;
}

contract DefOptFields {
    f: DefaultOptional;

    init() {
        self.f = DefaultOptional{}; // defaults apply
    }

    receive() {
        let k = self.f;
    }
}
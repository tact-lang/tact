// optional struct with defaulted optional field
struct DD {
    a: Int? = null;
}

contract DefOpt {
    d: DD?;

    init() {
        self.d = null;
    }
}
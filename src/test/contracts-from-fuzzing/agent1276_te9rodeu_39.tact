struct Opts {
    x: Int?;
    y: Bool?;
}

contract TestOkNoInit {
    s: Opts?;

    init() {
        // no assignment
    }
}
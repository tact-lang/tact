struct NestedOpts {
    oi: Int?; 
    ob: Bool?; 
    os: String?;
}

contract OptionalInInit {
    s: NestedOpts;

    init() {
        self.s = NestedOpts{
            oi: 42,
            ob: true,
            os: "Hi"
        };
    }
}
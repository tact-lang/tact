struct Inner {
    x: Int;
    y: Bool;
    z: String;
    opt: Int?;
}

contract TestOptional {
    innerField: Inner;

    init() {
        self.innerField = Inner{
            x: 11,
            y: false,
            z: "opt",
            opt: null,
        };
    }
}

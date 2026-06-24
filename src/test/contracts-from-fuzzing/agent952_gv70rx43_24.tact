struct OptBoolString {
    x: Bool?;
    y: String?;
}

contract OptVal {
    o: OptBoolString;

    init() {
        self.o = OptBoolString{
            x: null,
            y: null,
        };
    }
}

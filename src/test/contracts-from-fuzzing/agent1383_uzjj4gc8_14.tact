struct Param {
    x: Int;
    y: String?;
}

contract WithDefaults {
    data: Param = Param{
        x: 7,
        y: null
    };

    init() {
        self.data = Param{
            x: 8,
            y: "hi"
        };
    }
}
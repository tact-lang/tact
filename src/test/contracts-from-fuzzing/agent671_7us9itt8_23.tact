struct Mixed {
    s: String;
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            s: "hello",
            x: null,
            y: true
        };
    }
}
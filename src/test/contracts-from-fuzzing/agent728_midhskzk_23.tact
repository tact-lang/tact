struct Strs {
    a: String = "default";
    b: String;
}

contract TwoStrings {
    data: Strs;

    init() {
        self.data = Strs{
            b: "custom"
        };
    }
}
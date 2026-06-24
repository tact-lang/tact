struct SData {
    x: Int;
    y: String;
}

contract StructInOptional {
    a: SData?;

    init() {
        self.a = SData{
            x: 5,
            y: "hello"
        };
    }
}
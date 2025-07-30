// Optional struct with optional primitive fields
struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructContract {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            x: 1,
            y: null,
            z: "hello"
        };
    }
}

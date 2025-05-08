// struct with optionals as serialization target
struct SerialStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test25 {
    s: SerialStruct;

    init() {
        self.s = SerialStruct{
            a: null,
            b: "check",
            c: true,
        };
    }
}
// struct with interleaved optionals and non-optionals
struct MixFields {
    a: Int = 0;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "";
    f: String?;
}

contract MixOptionalOrder {
    value: MixFields = MixFields{};
    
    receive() {
        self.value = MixFields{
            a: 5,
            b: null,
            c: true,
            d: false,
            e: "txt",
            f: null,
        };
    }
}
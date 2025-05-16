// A wide struct with many optional fields, some with defaults, some without
struct WideOptional {
    a: Int? = null; b: Int?; c: Bool?; d: String? = null;
    e: Address?; f: Int?; g: Bool? = false; h: String?;
    i: Int? = null; j: Bool?; k: String?; l: Address? = null;
    m: Int?; n: Bool?; o: String? = "abc"; p: Address?;
    q: Int?; r: Bool?; s: String?; t: Address?;
}

contract TestContract {
    w: WideOptional;

    init() {
        self.w = WideOptional{};
    }
}
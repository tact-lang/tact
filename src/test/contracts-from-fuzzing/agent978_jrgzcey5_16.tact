// contract with a persistent state field of type Option<Struct> with deeply nested optionals inside struct
struct DeepOption {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptStructFieldContract {
    data: DeepOption?;

    init() {
        self.data = null;
    }
}
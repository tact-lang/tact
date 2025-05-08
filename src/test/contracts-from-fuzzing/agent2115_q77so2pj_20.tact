// contract fields of struct type with optional inner fields, no init
struct DeepOpt {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract FieldStruct {
    val: DeepOpt;
    init() {
        self.val = DeepOpt{};
    }
}
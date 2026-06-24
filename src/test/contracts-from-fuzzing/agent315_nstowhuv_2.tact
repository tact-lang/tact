struct DeepOptional {
    value: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    flag: Bool;
    text: String?;
}

contract OptContract {
    opt: DeepOptional;

    init() {
        self.opt = DeepOptional{ value: null, sub: null };
    }
}
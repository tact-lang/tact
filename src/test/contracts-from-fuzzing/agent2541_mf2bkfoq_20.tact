struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    deep: DeepOptional;
}

contract Opts {
    ctx: Container;

    init() {
        self.ctx = Container{ deep: DeepOptional{ a:null, b:null, c:null } };
    }
}
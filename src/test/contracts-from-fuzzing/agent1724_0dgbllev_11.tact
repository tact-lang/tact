struct Optionals1 {
    x: Int?;
    y: Bool?;
}

struct Optionals2 {
    left: Optionals1?;
    right: Optionals1?;
}

contract DeepOpt {
    data: Optionals2;
    init() {
        self.data = Optionals2{
            left: null,
            right: null
        };
    }
}
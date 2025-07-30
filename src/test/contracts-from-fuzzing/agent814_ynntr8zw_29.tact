// optional of struct with defaulted fields
struct OptDefault {
    x: Int = 12;
    y: Bool = true;
}

struct Wrap {
    opt: OptDefault?;
}

contract OptDefaultStruct {
    wrap: Wrap;
    init() {
        self.wrap = Wrap {
            opt: OptDefault{}
        };
    }
}

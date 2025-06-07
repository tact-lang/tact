struct Opt1 {
    x: Int?;
}

struct Opt2 {
    nested: Opt1?;
}

struct Opt3 {
    nested: Opt2?;
}

contract DeepNullable {
    nestedOpt: Opt3;

    init() {
        self.nestedOpt = Opt3{
            nested: Opt2{
                nested: Opt1{
                    x: null
                }
            }
        };
    }
}
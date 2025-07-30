struct OptionNest2 {
    x: Int?;
    y: Bool?;
}

struct Outer2 {
    nested: OptionNest2;
}

contract OptStructNested {
    data: Outer2;

    init() {
        self.data = Outer2{
            nested: OptionNest2{ x:null, y:true }
        };
    }
}
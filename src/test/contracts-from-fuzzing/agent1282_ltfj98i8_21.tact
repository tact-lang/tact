// deeply nested mixed optionals and not, anti-symmetric tree
struct AB {
    a: Int?;
    b: Int;
}
struct BA {
    a: Int;
    b: Int?;
}
struct Double {
    left: AB;
    right: BA;
}

contract TestMix {
    data: Double;

    init() {
        self.data = Double{
            left: AB{a:null,b:1},
            right: BA{a:2,b:null}
        };
    }
}
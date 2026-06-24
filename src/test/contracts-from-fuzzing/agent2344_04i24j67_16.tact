struct OptionalDeep {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Wrap {
    data: OptionalDeep;
    flag: Bool;
}

contract NestedOptionals {
    val: Wrap;

    init() {
        self.val = Wrap{
            data: OptionalDeep{x:null,y:null,z:null},
            flag: true,
        };
    }
}
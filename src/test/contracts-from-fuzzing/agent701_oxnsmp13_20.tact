struct Tiny {
    f: Bool;
}

contract FieldReplace {
    x: Tiny;

    init() {
        self.x = Tiny{ f:true };
        self.x = Tiny{ f:false };
    }
}
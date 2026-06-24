struct DefOuter {
    x: Int = 1;
    y: Bool = false;
}

contract OverwriteDefaults {
    f: DefOuter;

    init() {
        self.f = DefOuter{x:5,y:true};
    }
}
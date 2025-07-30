struct OneDefault {
    x: Int = 5;
    y: Bool = false;
}

contract PartialExplicit {
    d: OneDefault;

    init() {
        self.d = OneDefault{y:true};
    }
}

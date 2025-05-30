struct Defaulted {
    x:Int=1;
    y:Bool=false;
}

contract StorageDefaults {
    a:Defaulted;
    init() {
        self.a = Defaulted{};
    }
}
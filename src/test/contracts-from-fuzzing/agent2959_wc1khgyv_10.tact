struct DefaultOpt {
    x: Int = 5;
    y: Int?; // default null
    z: Bool = false;
}

contract DefaultsAndNullOptionals {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{x:10, y:null, z:true};
    }
}
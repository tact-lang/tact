struct Options {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract OptionalReinit {
    f: Options;

    init() {
        self.f = Options{x:null,y:null,z:null};
    }
    receive() {
        self.f = Options{x:123,y:"hi",z:true};
    }
}
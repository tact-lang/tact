struct Data {
    x: Int;
    y: Bool?;
}

contract DefaultValues {
    d1: Data = Data{x: 5, y: null};
    d2: Data = Data{x: 6, y: true};

    init() {
        self.d1 = Data{x:7,y:false};
        self.d2 = Data{x:8,y:null};
    }
}
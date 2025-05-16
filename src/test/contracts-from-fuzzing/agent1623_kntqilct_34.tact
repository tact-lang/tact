struct Opts {
    x: Int?;
    y: Bool?;
}

struct Container {
    opt1: Opts;
    opt2: Opts?;
}

contract MixOptOpt {
    nested: Container;
    init() {
        self.nested = Container{
            opt1: Opts{x:5,y:true},
            opt2: null,
        };
    }
}
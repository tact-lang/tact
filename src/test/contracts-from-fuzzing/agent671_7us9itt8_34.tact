struct Deep {
    z: Int?; 
    flag: Bool; 
}

struct Mid {
    deepOpt: Deep?;
    name: String;
}

struct Top {
    id: Int;
    midOpt: Mid?;
}

contract TestContract {
    nested: Top;

    init() {
        self.nested = Top{
            id: 321,
            midOpt: null
        };
    }
}
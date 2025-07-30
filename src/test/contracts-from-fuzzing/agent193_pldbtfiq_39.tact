struct Info {
    x: Int?;
    y: Bool?;
}

contract DoubleOptionSet {
    opt_struct: Info?;

    init() {
        self.opt_struct = Info{x:null,y:null};
    }
}
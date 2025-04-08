struct Container {
    aa: Int?; bb: Int?; cc: Int?; dd: Int?; ee: Int?;
    ff: Int?; gg: Int?; hh: Int?; ii: Int?; jj: Int?;
}

contract LotsOfOptionals {
    holder: Container;

    init() {
        self.holder = Container{
            aa:null, bb:null, cc:null, dd:null, ee:null,
            ff:null, gg:null, hh:null, ii:null, jj:null
        };
    }
}

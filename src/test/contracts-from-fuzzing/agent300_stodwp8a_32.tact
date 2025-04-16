struct LotsOpt {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;
}

contract TestContract {
    data: LotsOpt;

    init() {
        self.data = LotsOpt{
            a:null,
            b:2,
            c:null,
            d:4,
            e:5,
            f:null,
            g:7,
            h:8,
            i:9,
            j:10,
        };
    }
}
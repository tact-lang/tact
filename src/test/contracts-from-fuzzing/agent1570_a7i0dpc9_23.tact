struct MultiLayeredOpt {
    a: Int?;
    b: Layer2?;
}

struct Layer2 {
    c: Int?;
    d: Layer3?;
}

struct Layer3 {
    e: Int?;
}

contract TestContract {
    data: MultiLayeredOpt;
    init() {
        self.data = MultiLayeredOpt{ a:null, b:null };
    }
}
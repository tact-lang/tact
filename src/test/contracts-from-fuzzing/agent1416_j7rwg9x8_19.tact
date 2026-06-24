// test empty optional fields implicitly null in nested structs
struct SubOpt {
    a: Int?;
    b: Bool?;
}

struct TopOpt {
    s: SubOpt?;
}

contract AllNullNested {
    data: TopOpt;
    init() {
        self.data = TopOpt{s: null};
    }
}
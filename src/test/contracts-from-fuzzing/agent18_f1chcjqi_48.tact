struct O1 {
    a: Int?;
}

struct O2 {
    b: O1?;
}

struct O3 {
    c: O2?;
}

contract NestOptChain {
    data: O3;
    init() {
        self.data = O3{ c:null };
    }
}
struct Params {
    a: Int;
    b: Bool;
    
    c: Int?;
    d: Bool?;
}

contract TestContract {
    params: Params;
    
    init() {
        self.params = Params{a: 10, b: true, c: null, d: null};
    }
}
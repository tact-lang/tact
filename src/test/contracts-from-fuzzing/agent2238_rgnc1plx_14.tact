struct Data {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    d1: Data = Data{a: 1, b: true, c: "x"};
    d2: Data = Data{a: 2, b: false, c: "y"};
    d3: Data;

    init() {
        self.d3 = Data{a:3, b:true, c:"z"};
    }
}

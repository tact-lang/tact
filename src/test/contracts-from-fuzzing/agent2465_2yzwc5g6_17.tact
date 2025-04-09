struct Layer1 { 
    a: Int;
    opt: Layer2?;
}

struct Layer2 {
    s: String;
    flag: Bool;
}

contract TestContract {
    data: Layer1;
    init() {
        self.data = Layer1{
            a: 10,
            opt: null
        };
    }
}
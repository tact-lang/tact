struct Params {
    text: String = "abc";
    age: Int?; 
    f: Bool = true;
}

contract TestContract {
    p: Params;
    
    init() {
        self.p = Params{
            age: null
        };
    }
}
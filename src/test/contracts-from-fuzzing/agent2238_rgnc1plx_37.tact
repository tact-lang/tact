// Struct with defaults mixed with optionals and explicit init
struct Mix {
    a: Int = 42;
    b: Bool;
    c: String?;
}

contract TestContract {
    m: Mix;
    init() {
        self.m = Mix{b:false,c:null};
    }
}

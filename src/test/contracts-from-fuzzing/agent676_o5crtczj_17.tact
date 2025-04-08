struct Data1 {
    a: Int?;
    b: Bool;
}

struct Data2 {
    d1: Data1;
    s: String;
}

struct Data3 {
    d2: Data2?;
    flag: Bool;
}

contract TestContract {
    complex: Data3;

    init() {
        self.complex = Data3{
            d2: Data2{d1: Data1{a:null,b:false}, s:"str"},
            flag: true
        };
    }
}
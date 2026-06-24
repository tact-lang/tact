struct Optionals {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    a: Address?;
}

contract OptStructContract {
    data: Optionals;

    init() {
        self.data = Optionals{
            i:null,b:null,s:null,c:null,a:null
        };
    }
}
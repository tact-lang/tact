// Testing defaulted string with surrounding optional fields in struct
struct Weird {
    a: Int?;
    b: String = "default";
    c: Bool?;
}

contract TestContract {
    w: Weird;

    init() {
        self.w = Weird{
            a: null , c: null
        };
    }
}
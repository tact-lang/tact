struct Trouble {
    a: Int = 1;
    b: Int?;   
    c: Int = 2;
    d: Int?;
}

contract Fuzz31 {
    t: Trouble;

    init() {
        self.t = Trouble{
            b: null,
            d: null,
        };
    }
}
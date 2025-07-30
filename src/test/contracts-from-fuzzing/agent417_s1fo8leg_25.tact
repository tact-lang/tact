struct Mix2 {
    addr: Address?;
    flag: Bool?;
    num: Int?;
    text: String?;
    fix: Int;
}

contract TestContract {
    mix2field: Mix2;
    
    init() {
        self.mix2field = Mix2{
            addr: null,
            flag: null,
            num: 123,
            text: null,
            fix: 7
        };
    }
}
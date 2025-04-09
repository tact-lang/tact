struct Defaulted {
    x: Int = 1;
    y: Bool = true;
    s: String = "str";
    o: Int?;
}

contract DefaultsStruct {
    d: Defaulted = Defaulted{
        o:null
    };
    receive() {
        let _ = self.d.s;
    }
}
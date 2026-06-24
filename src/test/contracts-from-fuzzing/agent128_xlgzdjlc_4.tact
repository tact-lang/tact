struct LargeOptionalStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: Int?;
    opt4: Bool?;
    opt5: Int?;
    opt6: Bool?;
    opt7: Int?;
    opt8: Bool?;
    opt9: Int?;
    opt10: Bool?;
}

contract TestContract {
    complex: LargeOptionalStruct;

    init() {
        self.complex = LargeOptionalStruct{
            opt1: null, opt2: false, opt3: null, opt4: true,
            opt5: 5, opt6: null, opt7: 7, opt8: null,
            opt9: 9, opt10: true
        };
    }
}
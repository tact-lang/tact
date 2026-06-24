struct OptionalFields {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Address?;
    opt5: Cell?;
}

contract TestContract {
    data: OptionalFields;
    init() {
        self.data = OptionalFields{
            opt1:null, opt2:null, opt3:null, opt4:null, opt5:null
        };
    }
}
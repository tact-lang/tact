struct ManyOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
}

contract TestContract {
    optStruct: ManyOptionals;
    
    init() {
        self.optStruct = ManyOptionals{
            optInt: null,
            optBool: true,
            optAddress: null,
        };
    }
    
    receive() {}
}
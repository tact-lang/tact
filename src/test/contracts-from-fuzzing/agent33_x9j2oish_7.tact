struct OptionalDeep {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
}

contract DeepOptionals {
    state: OptionalDeep;

    init() {
        self.state = OptionalDeep{
            f1:null, f2:null, f3:null, f4:null, f5:null
        };
    }
}
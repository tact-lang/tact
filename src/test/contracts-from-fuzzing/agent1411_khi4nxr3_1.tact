struct InnerStruct {
    alpha: Int;
    beta: String;
    gamma: Bool?;
}

contract TestContract {
    sample: InnerStruct;
    
    init() {
        self.sample = InnerStruct{
            alpha: 1,
            beta: "test",
            gamma: true,
        };
    }
}
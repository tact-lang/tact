struct OptInStruct {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract DeepOptional {
    val: OptInStruct?;

    init() {
        self.val = OptInStruct{i:5,b:null,s:"hello"};
    }
}

struct NullableVariants {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    data1: NullableVariants;
    data2: NullableVariants;

    init() {
        self.data1 = NullableVariants{i:null,b:null,s:null};
        self.data2 = NullableVariants{i:1,b:true,s:"x"};
    }
}

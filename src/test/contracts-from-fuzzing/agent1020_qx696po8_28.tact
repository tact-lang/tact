struct BoolVariants {
    one: Bool;
    two: Bool?;
    three: Bool;
    four: Bool?;
}

contract BoolVariantsTest {
    data: BoolVariants;

    init() {
        self.data = BoolVariants{ one:true, two:null, three:false, four:null };
    }
}
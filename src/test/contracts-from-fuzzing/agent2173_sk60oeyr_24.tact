struct OptionalStruct {
    alpha: Int?;
    beta: Bool?;
}

contract OptStructTest {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{ alpha:null, beta:true };
    }
}
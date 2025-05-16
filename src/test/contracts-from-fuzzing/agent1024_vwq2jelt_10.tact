struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Cell?;
}

contract OptionalFieldsContract {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            f1:null, f2:null, f3:null, f4:null, f5:null
        };
    }
}
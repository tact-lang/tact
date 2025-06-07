struct OnlyOptionals {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract AllOptionalStorage {
    val: OnlyOptionals;
    init() {
        self.val = OnlyOptionals{
            one:null, two:true, three:null
        };
    }
}
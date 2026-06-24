struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
}

contract AllOptional {
    data: OnlyOptionals;

    init() {
        self.data = OnlyOptionals{
            a:null,b:null,c:null,d:null
        };
    }
}
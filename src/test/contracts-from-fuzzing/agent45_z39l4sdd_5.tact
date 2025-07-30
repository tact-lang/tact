struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OnlyNullable {
    data: OnlyOptionals;

    init() {
        self.data = OnlyOptionals{
            a:null,b:null,c:null,d:null
        };
    }
}
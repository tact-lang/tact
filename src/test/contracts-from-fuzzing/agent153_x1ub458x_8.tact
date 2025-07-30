struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract ManyOptionalsContract {
    foo: ManyOptionals = ManyOptionals{a:null, b:null, c:null, d:null, e:null};
}
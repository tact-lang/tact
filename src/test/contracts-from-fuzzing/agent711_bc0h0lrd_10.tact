struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract ManyOptionalsFields {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            a:null, b:true, c:"hi", d:null, e:null
        };
    }
}

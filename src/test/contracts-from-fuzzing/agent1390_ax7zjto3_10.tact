struct OptionalPrimitives {
    ia: Int?;
    fa: Bool?;
    sa: String?;
    ca: Cell?;
    sla: Slice?;
    aa: Address?;
}

contract ManyOptionalPrimitives {
    stash: OptionalPrimitives;

    init() {
        self.stash = OptionalPrimitives{
            ia:null, fa:null, sa:null, ca:null, sla:null, aa:null
        };
    }
}
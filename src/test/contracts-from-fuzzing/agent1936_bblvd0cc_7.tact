struct LongOptionals {
    v1: Int?;
    v2: Int?;
    v3: Bool?;
    v4: Address?;
    v5: Cell?;
    v6: Slice?;
    v7: Builder?;
    v8: String?;
}

contract ManyOptionals {
    data: LongOptionals;

    init() {
        self.data = LongOptionals{
            v1:null, v2:null, v3:null, v4:null,
            v5:null, v6:null, v7:null, v8:null
        };
    }
}
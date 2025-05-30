struct BigNested {
    nested1: Int;
    nested2: String;
    nested3: Bool;
    nested4: Int?;
    nested5: String?;
}

contract InitializeOptionals {
    a: BigNested?;
    
    init() {
        self.a = BigNested{
            nested1: 100,
            nested2: "big",
            nested3: true,
            nested4: null,
            nested5: null
        };
    }
}
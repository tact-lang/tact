struct DeepStruct {
    a: Int; b: Nested1;
}
struct Nested1 {
    x: Int; y: Nested2;
}
struct Nested2 {
    s: String; f: Bool; m: Nested3;
}
struct Nested3 {
    q: Int;
}
contract ComplexPersist {
    state: DeepStruct;
    
    init() {
        self.state = DeepStruct{
            a: 100,
            b: Nested1{
                x: 200,
                y: Nested2{
                    s: "hi",
                    f: true,
                    m: Nested3{
                        q: 300
                    }
                }
            }
        };
    }
}
// Deep nesting of structs with many optional fields
struct D1 { a: Int?; b: Bool?; }
struct D2 { d1: D1?; s: String; }
struct D3 { d2: D2?; val: Int; }

contract DeepOptionals {
    data: D3;

    init() {
        self.data = D3{
            d2: D2{
                d1: D1{a:null, b:true},
                s: "xxxxx"
            },
            val: 42
        };
    }
}
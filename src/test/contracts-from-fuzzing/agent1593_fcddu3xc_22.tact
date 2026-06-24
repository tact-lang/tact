// Struct with many fields and explicit default values
struct WithDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;
    d: Int?; 
    e: Bool?;
    f: String?;
}

contract DefsTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{
            d:null,e:null,f:null
        };
    }
}
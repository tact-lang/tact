struct InnerMost {
    imField1: Int;
}

struct Inner {
    iField1: Int;
    iField2: Bool;
    iField3: InnerMost; 
    iField4: String?;
}

struct Outer {
    oField1: Int;
    oField2: Bool;
    oField3: String;
    oField4: Inner;  
    oField5: Int?;
}

contract DeepNestedTest {
    storageField: Outer;
    
    init() {
        self.storageField = Outer{
            oField1: 1,
            oField2: true,
            oField3: "test",
            oField4: Inner{
                iField1: 2,
                iField2: false,
                iField3: InnerMost{imField1: 3},
                iField4: null,
            },
            oField5: null,
        };
    }
}
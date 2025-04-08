contract NullableFields {
    fooOpt: Int?;        // should default to null
    barOpt: String?;     // should default to null
    
    init() {
        self.fooOpt = 123;
        self.barOpt = "test";
    }

    receive() {
        let _ = self.fooOpt;
        let _ = self.barOpt;
    }
}
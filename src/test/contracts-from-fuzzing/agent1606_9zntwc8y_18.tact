contract BoolOptionalFields {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;

    init() {
        self.f1=null;
        self.f2=null;
        self.f3=null;
    }

    receive() {
        let a = self.f1;
        let b = self.f2;
        let c = self.f3;
    }
}
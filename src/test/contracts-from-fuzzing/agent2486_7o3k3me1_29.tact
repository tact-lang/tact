contract OptionalFieldNulls {
    a:Int?;
    b:String?;

    init() {
        self.a = null;
        self.b = null;
    }
}
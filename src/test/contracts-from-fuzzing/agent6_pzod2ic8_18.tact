contract PersistentAllTypes {
    myInt: Int;
    myBool: Bool;
    myString: String;
    myOptInt: Int?;
    myOptBool: Bool?;
    myOptString: String?;
    
    init() {
        self.myInt = 123;
        self.myBool = false;
        self.myString = "ok";
        self.myOptInt = null;
        self.myOptBool = true;
        self.myOptString = "maybe";
    }
}
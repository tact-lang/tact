contract MixedOptionals {
    opt1: Int?;
    val: Int = 1;
    opt2: Bool?;
    defBool: Bool = false;

    init() {
        self.opt1=null;
        self.opt2=null;
        self.val=5;
        self.defBool=true;
    }
}
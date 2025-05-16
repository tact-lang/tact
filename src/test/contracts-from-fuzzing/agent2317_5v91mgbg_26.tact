struct T {
    f1: Int = 1;
    f2: String = "test";
    f3: Bool = true;
}

contract WithDefaultStruct {
    x: T;

    init() {
        self.x = T{f1:2,f2:"new",f3:false};
    }
}
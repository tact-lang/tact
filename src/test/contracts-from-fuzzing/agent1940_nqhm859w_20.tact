struct LargeOptional {
    val1: Int?;
    val2: Bool?;
    val3: String?;
    val4: Bool?;
    val5: Int?;
}

contract MultipleOptionals {
    storage: LargeOptional;

    init() {
        self.storage = LargeOptional{
            val1:null, val2:true, val3:null, val4:false, val5:123
        };
    }
}
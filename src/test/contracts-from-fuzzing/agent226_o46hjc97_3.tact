struct HasManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Bool?;
    f5: Bool?;
    f6: Int?;
}

contract TestOptionals {
    state: HasManyOptionals;

    init() {
        self.state = HasManyOptionals{
            f1:null, f2:2, f3:null, f4:true, f5:null, f6:6
        };
    }
}

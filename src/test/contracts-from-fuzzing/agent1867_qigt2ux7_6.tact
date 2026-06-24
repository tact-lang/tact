struct ManyOptionals {
    f1: Bool?;
    f2: Bool?;
    f3: Int?;
    f4: Int?;
}

contract ManyOptTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{f1:true,f2:null,f3:null,f4:42};
    }
}
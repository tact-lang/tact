struct ManyOptionals {
    opt1: Int?;
    opt2: Int?;
    opt3: Int?;
    opt4: String?;
    opt5: String?;
    opt6: Bool?;
    opt7: Bool?;
    opt8: String?;
    opt9: Int?;
    opt10: Bool?;
}

contract ManyOptTest {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            opt1:null,opt2:null,opt3:null,opt4:null,opt5:null,
            opt6:null,opt7:null,opt8:null,opt9:null,opt10:null
        };
    }
}
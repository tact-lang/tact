struct ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Bool?;
    f5: String?;
}

contract ManyNullsTest {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            f1:null,f2:null,f3:null,f4:null,f5:null
        };
    }
}
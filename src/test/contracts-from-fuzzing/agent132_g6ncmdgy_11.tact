struct ManyOptionals { f0:Int?; f1:Int?; f2:Int?; f3:Int?; f4:Int?; f5:Int?; }

contract ManyOptionalsTest {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{f0:null,f1:null,f2:null,f3:null,f4:null,f5:null};
    }
}
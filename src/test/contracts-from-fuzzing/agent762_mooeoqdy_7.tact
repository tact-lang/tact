struct ManyOptionals {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: Int?; o7: Int?; o8: Int?; o9: Int?; o10: Int?;
}

contract TestContract {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{ 
            o1:null,o2:null,o3:null,o4:null,o5:null,
            o6:null,o7:null,o8:null,o9:null,o10:null};
    }

    receive() {
        self.data = ManyOptionals{
            o1:1,o2:2,o3:3,o4:4,o5:5,o6:6,o7:7,o8:8,o9:9,o10:10
        };
    }
}
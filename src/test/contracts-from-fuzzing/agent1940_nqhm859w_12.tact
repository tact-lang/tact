struct Opts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract MixingOptionals {
    data: Opts;

    init() {
        self.data = Opts{
            o1:null, o2:true, o3:null
        };
    }
}
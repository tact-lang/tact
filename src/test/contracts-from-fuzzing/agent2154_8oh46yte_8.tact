struct Compose {
    one: Int;
    two: Int?;
    three: Bool;
    four: String?;
}

contract ComposeContract {
    c1: Compose;
    c2: Compose;

    init() {
        self.c1 = Compose{one:1,two:2,three:true,four:null};
        self.c2 = Compose{one:3,two:null,three:false,four:"hi"};
    }
}
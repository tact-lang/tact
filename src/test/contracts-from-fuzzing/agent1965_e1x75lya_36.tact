struct BOps {
    a: Bool;
    b: Bool?;
}

contract BoolOptions {
    data: BOps;
    init() {
        self.data = BOps{ a:true, b:null };
    }
}
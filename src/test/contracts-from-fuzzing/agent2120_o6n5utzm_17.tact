struct RepeatedFields {
    x: Int;
    y: Int;
    z: Int;
    label: String;
    flag: Bool;
    opt: Int?;
}

contract LongInit {
    storage: RepeatedFields;
    init() {
        self.storage = RepeatedFields{
            x:1, y:2, z:3, label:"hi", flag:true, opt:null
        };
    }
}
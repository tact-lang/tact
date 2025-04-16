struct Data {
    i: Int;
    b: Bool;
    s: String;
}

contract WithDefault {
    data: Data = Data{ i:42, b:true, s:"hello" };

    init() {
        self.data = Data{ i:100, b:false, s:"world" };
    }
}
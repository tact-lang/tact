struct MyStruct {
    a: Int;
    b: Bool;
}

contract ListFields {
    s: MyStruct;
    x: Int;
    y: Bool;
    z: String;

    init() {
        self.s = MyStruct{a:1,b:true};
        self.x = 5;
        self.y = false;
        self.z = "test";
    }
}
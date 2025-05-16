contract DefaultInitContract {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
    s: SmallStruct = SmallStruct{ a:1, b:true };

    init() {
        self.x = 5;
        self.y = true;
        self.z = "data";
        self.s = SmallStruct{ a:10, b:false };
    }
} 

struct SmallStruct {
    a: Int;
    b: Bool;
}
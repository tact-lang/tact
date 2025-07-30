struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract DefaultInStruct {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            a:2,b:true,c:"y"
        };
    }
}
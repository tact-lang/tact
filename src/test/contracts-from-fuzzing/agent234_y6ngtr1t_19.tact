struct ZeroDefaults {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
}

contract ZeroDefaultsContract {
    data: ZeroDefaults;

    init() {
        self.data = ZeroDefaults{x:0,y:false,z:""};
    }
}
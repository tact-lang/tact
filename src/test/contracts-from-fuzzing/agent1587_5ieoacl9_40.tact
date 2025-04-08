struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract ZeroInit {
    z: ZeroDefaults;

    init(){
        self.z = ZeroDefaults{};
    }
}
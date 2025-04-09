struct ZeroDefaults {
	z:Int; 
}
contract Test34 {
    zed:ZeroDefaults;
    init() {
        self.zed=ZeroDefaults{z:0};
    }
}
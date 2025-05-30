struct Container {
    sInt: Int?;
    sBool: Bool?;
    sStr: String?;
}

contract MixOptStruct {
    inner: Container?;

    init() {
        self.inner = null;
    }
}